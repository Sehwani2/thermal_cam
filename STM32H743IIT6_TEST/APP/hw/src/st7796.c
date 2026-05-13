#include "st7796.h"
#include "st7796_regs.h"
#include "gpio.h"
#include "cli.h"
#include "stm32h7xx_ll_spi.h"
#include "led.h"


#define _PIN_DEF_BL     0
#define _PIN_DEF_DC     2
#define _PIN_DEF_CS     3
#define _PIN_DEF_RST    1


#define MADCTL_MY       0x80
#define MADCTL_MX       0x40
#define MADCTL_MV       0x20
#define MADCTL_ML       0x10
#define MADCTL_RGB      0x00
#define MADCTL_BGR      0x08
#define MADCTL_MH       0x04

#define FRAME_BUF_CNT   5


static void writecommand(uint8_t c);
static void writedata(uint8_t d);
static void st7796InitRegs(void);
static void st7796SetRotation(uint8_t m);
static bool st7796Reset(void);
//static void st7796DoneISR(SPI_HandleTypeDef *hspi);


extern SPI_HandleTypeDef hspi1;

static volatile bool is_ready = true;

static bool is_init = false;
static uint32_t pre_time_req;
static uint32_t exe_time_req;

static const int32_t _width  = HW_ST7796_WIDTH;
static const int32_t _height = HW_ST7796_HEIGHT;
static const uint32_t colstart = 0;
static const uint32_t rowstart = 0;



#ifdef _USE_HW_CLI
static void cliCmd(cli_args_t *args);
#endif





bool st7796Init(void)
{
  bool ret = true;

  if (is_init)
    return true;

  delay(100);

  ret = st7796Reset();

  is_init = ret;

  //HAL_SPI_RegisterCallback(&hspi1, HAL_SPI_TX_COMPLETE_CB_ID, st7796DoneISR);

#ifdef _USE_HW_CLI
  cliAdd("st7796", cliCmd);
#endif

  return ret;
}

//void st7796DoneISR(SPI_HandleTypeDef *hspi)
//{
////  gpioPinWrite(_PIN_DEF_CS, _DEF_HIGH);
////
////  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
////  LL_SPI_SetDataWidth(hspi1.Instance, LL_SPI_DATAWIDTH_8BIT);
//
////  exe_time_req = millis()-pre_time_req;
//  is_ready = true;
//}

bool st7796IsReady(void)
{
  return is_ready;
}

void st7796GetInfo(st7796_info_t *p_info)
{
  p_info->req_time = exe_time_req;
}

bool st7796Reset(void)
{
  gpioPinWrite(_PIN_DEF_BL , _DEF_LOW);
  gpioPinWrite(_PIN_DEF_DC , _DEF_HIGH);
  gpioPinWrite(_PIN_DEF_CS , _DEF_HIGH);
  gpioPinWrite(_PIN_DEF_RST, _DEF_LOW);
  delay(10);
  gpioPinWrite(_PIN_DEF_RST, _DEF_HIGH);

  st7796InitRegs();

  st7796SetRotation(3);
  st7796FillRect(0, 0, _width, _height, black);
  return true;
}

uint16_t st7796GetWidth(void)
{
  return _width;
}

uint16_t st7796GetHeight(void)
{
  return _height;
}

void writecommand(uint8_t c)
{
  gpioPinWrite(_PIN_DEF_DC, _DEF_LOW);
  gpioPinWrite(_PIN_DEF_CS, _DEF_LOW);

  HAL_SPI_Transmit(&hspi1, &c, 1, 50);

  gpioPinWrite(_PIN_DEF_CS, _DEF_HIGH);
}

void writedata(uint8_t d)
{
  gpioPinWrite(_PIN_DEF_DC, _DEF_HIGH);
  gpioPinWrite(_PIN_DEF_CS, _DEF_LOW);

  HAL_SPI_Transmit(&hspi1, &d, 1, 50);

  gpioPinWrite(_PIN_DEF_CS, _DEF_HIGH);
}

void st7796InitRegs(void)
{
  writecommand(ST7796_SWRESET); //  1: Software reset, 0 args, w/delay
  delay(10);

  writecommand(ST7796_SLPOUT);  //  2: Out of sleep mode, 0 args, w/delay
  delay(100);

  writecommand(ST7796_INVON);  // 13: Don't invert display, no args, no delay

  writecommand(ST7796_MADCTL);  // 14: Memory access control (directions), 1 arg:
  writedata(0x08);              //     row addr/col addr, bottom to top refresh

  writecommand(ST7796_COLMOD);  // 15: set color mode, 1 arg, no delay:
  writedata(0x55);              //     16-bit color rgb565


  writecommand(ST7796_CASET);   //  1: Column addr set, 4 args, no delay:
  writedata(0x00);
  writedata(0x00);              //     XSTART = 0
  writedata((uint8_t)((HW_ST7796_WIDTH-1)>>8));
  writedata((uint8_t)((HW_ST7796_WIDTH-1)>>0));    //     XEND =

  writecommand(ST7796_RASET);   //  2: Row addr set, 4 args, no delay:
  writedata(0x00);
  writedata(0x00);              //     XSTART = 0
  writedata((uint8_t)((HW_ST7796_HEIGHT-1)>>8));
  writedata((uint8_t)((HW_ST7796_HEIGHT-1)>>0));   //     XEND =




  writecommand(ST7796_NORON);   //  3: Normal display on, no args, w/delay
  delay(10);
  writecommand(ST7796_DISPON);  //  4: Main screen turn on, no args w/delay
  delay(10);
//  writecommand(0x11);
//  delay(120);
//  writecommand(0x36);
//  writedata(0x48);
//  writecommand(0x3A);
//  writedata(0x55);
//  writecommand(0xF0);
//  writedata(0xC3);
//  writecommand(0xF0);
//  writedata(0x96);
//  writecommand(0xB4);
//  writedata(0x02);
//  writecommand(0xB7);
//  writedata(0xC6);
//  writecommand(0xC0);
//  writedata(0xC0);
//  writedata(0x00);
//  writecommand(0xC1);
//  writedata(0x13);
//  writecommand(0xC2);
//  writedata(0xA7);
//  writecommand(0xC5);
//  writedata(0x21);
//  writecommand(0xC5);
//  writedata(0x21);
//
//  writecommand(0xE8);
//  writedata(0x40);
//  writedata(0x8A);
//  writedata(0x1B);
//  writedata(0x1B);
//  writedata(0x23);
//  writedata(0x0A);
//  writedata(0xAC);
//  writedata(0x33);
//
//  writecommand(0xE0);
//  writedata(0xD2);
//  writedata(0x05);
//  writedata(0x08);
//  writedata(0x06);
//  writedata(0x05);
//  writedata(0x02);
//  writedata(0x2A);
//  writedata(0x44);
//  writedata(0x46);
//  writedata(0x39);
//  writedata(0x15);
//  writedata(0x15);
//  writedata(0x2D);
//  writedata(0x32);
//
//  writecommand(0xE1);
//  writedata(0x96);
//  writedata(0x08);
//  writedata(0x0C);
//  writedata(0x09);
//  writedata(0x09);
//  writedata(0x25);
//  writedata(0x2E);
//  writedata(0x43);
//  writedata(0x42);
//  writedata(0x35);
//  writedata(0x11);
//  writedata(0x11);
//  writedata(0x28);
//  writedata(0x2E);
//
//  writecommand(0xF0);
//  writedata(0x3C);
//  writedata(0xF0);
//  writedata(0x69);
//
//  delay(120);
//  writecommand(0x21);
//  writecommand(0x29);
}

void st7796SetRotation(uint8_t mode)
{
  writecommand(ST7796_MADCTL);

  switch (mode)
  {
   case 0:
     writedata(MADCTL_MX | MADCTL_MY | MADCTL_RGB);
     break;

   case 1:
     writedata(MADCTL_MY | MADCTL_MV | MADCTL_RGB);
     break;

  case 2:
    writedata(MADCTL_RGB);
    break;

   case 3:
//     writedata(MADCTL_MX | MADCTL_MV | MADCTL_RGB);
     writedata((1<<3)|(1<<7)|(1<<6)|(1<<5));
     break;
  }
}

void st7796SetWindow(int32_t x0, int32_t y0, int32_t x1, int32_t y1)
{
  writecommand(ST7796_CASET);   // Column addr set
  writedata((x0+colstart)>>8);
  writedata((x0+colstart)>>0);  // XSTART
  writedata((x1+colstart)>>8);
  writedata((x1+colstart)>>0);  // XEND

  writecommand(ST7796_RASET);   // Row addr set
  writedata((y0+rowstart)>>8);
  writedata((y0+rowstart)>>0);  // YSTART
  writedata((y1+rowstart)>>8);
  writedata((y1+rowstart)>>0);  // YEND

  writecommand(ST7796_RAMWR);   // write to RAM
}

void st7796FillRect(int32_t x, int32_t y, int32_t w, int32_t h, uint32_t color)
{
  uint16_t line_buf[w];

  // Clipping
  if ((x >= _width) || (y >= _height)) return;

  if (x < 0) { w += x; x = 0; }
  if (y < 0) { h += y; y = 0; }

  if ((x + w) > _width)  w = _width  - x;
  if ((y + h) > _height) h = _height - y;

  if ((w < 1) || (h < 1)) return;


  st7796SetWindow(x, y, x + w - 1, y + h - 1);

  hspi1.Init.DataSize = SPI_DATASIZE_16BIT;
  LL_SPI_SetDataWidth(hspi1.Instance, LL_SPI_DATAWIDTH_16BIT);

  gpioPinWrite(_PIN_DEF_DC, _DEF_HIGH);
  gpioPinWrite(_PIN_DEF_CS, _DEF_LOW);

  for (int i=0; i<w; i++)
  {
    line_buf[i] = color;
  }
  for (int i=0; i<h; i++)
  {
    HAL_SPI_Transmit(&hspi1, (const uint8_t *)line_buf, w, 10);
  }
  gpioPinWrite(_PIN_DEF_CS, _DEF_HIGH);

  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
  LL_SPI_SetDataWidth(hspi1.Instance, LL_SPI_DATAWIDTH_8BIT);
}

//bool st7796SendBuffer(uint8_t *p_data, uint32_t length, uint32_t timeout_ms)
//{
//
//  is_ready = false;
//  pre_time_req = millis();
//
//  //  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
//  //  LL_SPI_SetDataWidth(hspi1.Instance, LL_SPI_DATAWIDTH_8BIT);
//  hspi1.Init.DataSize = SPI_DATASIZE_16BIT;
//  LL_SPI_SetDataWidth(hspi1.Instance, LL_SPI_DATAWIDTH_16BIT);
//
//  gpioPinWrite(_PIN_DEF_DC, _DEF_HIGH);
//  gpioPinWrite(_PIN_DEF_CS, _DEF_LOW);
//
//  const uint32_t pixels_chunk = length / 4;   // 153600 / 4
//  uint8_t *ptr = p_data;
//
//  for (int i = 0; i < 4; i++)
//  {
//    uint32_t this_chunk = (i == 3) ? (length - pixels_chunk*3) : pixels_chunk;
//
//    HAL_SPI_Transmit_DMA(&hspi1, ptr, this_chunk);
//
//    uint32_t tick = millis();
//    while (!is_ready)
//    {
//      if (millis() - tick > 100)
//      {
//        gpioPinWrite(_PIN_DEF_CS, _DEF_HIGH);
//        is_ready = true;
//        return false;
//      }
//    }
//    ptr += this_chunk * 2;
//    is_ready = false;
//  }
//
//  gpioPinWrite(_PIN_DEF_CS, _DEF_HIGH);
//  exe_time_req = millis() - pre_time_req;
//  is_ready = true;
//  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
//  LL_SPI_SetDataWidth(hspi1.Instance, LL_SPI_DATAWIDTH_8BIT);
//
//  return true;
//}

static uint8_t *tx_ptr;
static uint32_t total_length;
static uint32_t chunk_size;
static uint32_t chunk_index;
static const uint32_t chunk_count = 4;

bool st7796SendBuffer(uint8_t *p_data, uint32_t length, uint32_t timeout_ms)
{
    if (length == 0) return false;

    if (!is_ready) return false;

    is_ready = false;
    pre_time_req = millis();

    hspi1.Init.DataSize = SPI_DATASIZE_16BIT;
    LL_SPI_SetDataWidth(hspi1.Instance, LL_SPI_DATAWIDTH_16BIT);

    gpioPinWrite(_PIN_DEF_DC, _DEF_HIGH);
    gpioPinWrite(_PIN_DEF_CS, _DEF_LOW);

    total_length = length;
    chunk_size = length / chunk_count;              // 기본 청크
    uint32_t remainder = length % chunk_count;      // 나머지

    chunk_index = 0;
    tx_ptr = p_data;

    uint32_t first_chunk = chunk_size + remainder;

    HAL_SPI_Transmit_DMA(&hspi1, tx_ptr, first_chunk);

    return true;
}

void HAL_SPI_TxCpltCallback(SPI_HandleTypeDef *hspi)
{
    if (hspi != &hspi1) return;

    chunk_index++;

    if (chunk_index < chunk_count)
    {
        tx_ptr += chunk_size * 2;
        uint32_t this_chunk = chunk_size;

        HAL_SPI_Transmit_DMA(&hspi1, tx_ptr, this_chunk);
    }
    else
    {
        gpioPinWrite(_PIN_DEF_CS, _DEF_HIGH);

        is_ready = true;

        // 8비트 복구
        hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
        LL_SPI_SetDataWidth(hspi1.Instance, LL_SPI_DATAWIDTH_8BIT);

        exe_time_req = millis() - pre_time_req;
    }
}



#ifdef _USE_HW_CLI

void cliCmd(cli_args_t *args)
{
  bool ret = false;


  if (args->argc == 1 && args->isStr(0, "info"))
  {
    cliPrintf("Width  : %d\n", _width);
    cliPrintf("Heigth : %d\n", _height);
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "test"))
  {
    uint32_t pre_time;
    uint32_t pre_time_draw;
    uint16_t color_tbl[3] = {red, green, blue};
    uint8_t color_index = 0;


    pre_time = millis();
    while(cliKeepLoop())
    {
      if (millis()-pre_time >= 500)
      {
        pre_time = millis();

        if (color_index == 0) cliPrintf("draw red\n");
        if (color_index == 1) cliPrintf("draw green\n");
        if (color_index == 2) cliPrintf("draw blue\n");

        pre_time_draw = millis();
        st7796FillRect(0, 0, _width, _height, color_tbl[color_index]);
        color_index = (color_index + 1)%3;

        cliPrintf("draw time : %d ms\n", millis()-pre_time_draw);
      }
      delay(1);
    }

    ret = true;
  }

  if (ret == false)
  {
    cliPrintf("st7796 info\n");
    cliPrintf("st7796 test\n");
  }
}


#endif
