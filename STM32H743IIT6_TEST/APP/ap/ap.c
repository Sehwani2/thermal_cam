#include "ap.h"
#include "cli/cli_thread.h"



void apInit(void)
{
  //cliOpen(_DEF_UART1, 115200);
  //cliLogo();

  cliThreadInit();
}
void apMain(void)
{
  uint32_t pre_time;

  pre_time = millis();
  while(1)
  {
    if(millis()-pre_time >= 500)
    {
      pre_time = millis();
      ledToggle(0);
    }

    delay(10);
  }
}





//void apMain(void)
//{
//    gpioPinMode(0, 1);
//    lcdClear(white);
//
//    while(1)
//    {
//        if (MLX90640_ReadFrame() != 0) {
//            delay(1);
//            continue;
//        }
//
//        uint16_t *buf = (uint16_t *)lcdGetFrameBuffer();
//
//        // 1. min/max 계산 (768번이라 빠름)
//        float min_t = 100.0f, max_t = -100.0f;
//        for(int i=0; i<768; i++) {
//            float t = mlx90640.to[i];
//            if(t < min_t) min_t = t;
//            if(t > max_t) max_t = t;
//        }
//        if(max_t - min_t < 4.0f) max_t = min_t + 4.0f;
//
//        // 2. 초고속 10배 Nearest + 좌우 반전 + 32bit 쓰기
//        const int offset_y = 40;
//        const int offset_x = 80;
//
//        for(int sy=0; sy<24; sy++)
//        {
//            int base_y = offset_y + sy*10;
//
//            for(int sx=0; sx<32; sx++)
//            {
//                int sx_mirror = 31 - sx;                     // 좌우 반전
//                float temp = mlx90640.to[sy*32 + sx_mirror];
//                uint16_t color = TempToRGB565(temp, min_t, max_t);
//
//                int base_x = offset_x + sx*10;
//
//                // 10줄을 32bit 단위로 한 번에 쏜다 → 5배 빠름
//                uint32_t color32 = color | (color << 16);
//
//                for(int py=0; py<10; py++)
//                {
//                    uint32_t *p32 = (uint32_t*)(buf + (base_y + py)*480 + base_x);
//                    p32[0] = color32;
//                    p32[1] = color32;
//                    p32[2] = color32;
//                    p32[3] = color32;
//                    p32[4] = color32;    // 10픽셀 한 번에
//                }
//            }
//        }
//
//        lcdUpdateDraw();
//    }
//}

//void apMain(void)
//{
//  gpioPinMode(0, 1);
//  lcdClear(black);
//  while(1)
//  {
//    if (MLX90640_ReadFrame() != 0) {
//      delay(50);
//      continue;
//    }
//
//    uint16_t *buf = (uint16_t *)lcdGetFrameBuffer();  // frame_buffer[0]
//
//    // 1. 자동 min/max 계산 (색상 범위 최적화)
//    float max_t = mlx90640.to[0];
//    float min_t = mlx90640.to[0];
//    for(int i = 1; i < 768; i++) {
//      if(mlx90640.to[i] > max_t) max_t = mlx90640.to[i];
//      if(mlx90640.to[i] < min_t) min_t = mlx90640.to[i];
//    }
//    float range = max_t - min_t;
//    if(range < 3.0f) range = 3.0f;          // 최소 대비 확보
//    min_t -= range * 0.1f;
//    max_t += range * 0.1f;
//
//    // 2. 32×24 → 정확히 10배 (320×240) 중앙 배치 + Bilinear 보간
//    const int dst_w = 320;
//    const int dst_h = 240;
//    const int offset_x = (480 - dst_w) / 2;   // 80
//    const int offset_y = (320 - dst_h) / 2;   // 40
//
//    for(int y = 0; y < dst_h; y++)
//    {
//      float src_y = y * (24.0f / dst_h);     // 0.0 ~ 23.999
//      int   iy    = (int)src_y;
//      float fy    = src_y - iy;
//      if(iy >= 23) { iy = 22; fy = 1.0f; }
//
//      int lcd_y = offset_y + y;
//
//      for(int x = 0; x < dst_w; x++)
//      {
//        float src_x = x * (32.0f / dst_w); // 0.0 ~ 31.999
//        int   ix    = (int)src_x;
//        float fx    = src_x - ix;
//        if(ix >= 31) { ix = 30; fx = 1.0f; }
//
//        // 4개 픽셀 bilinear
//        float t00 = mlx90640.to[iy     *32 + ix];
//        float t10 = mlx90640.to[iy     *32 + (ix+1)];
//        float t01 = mlx90640.to[(iy+1)*32 + ix];
//        float t11 = mlx90640.to[(iy+1)*32 + (ix+1)];
//
//        float temp = t00*(1-fx)*(1-fy) + t10*fx*(1-fy) +
//            t01*(1-fx)*fy     + t11*fx*fy;
//
//        uint16_t color = TempToRGB565(temp, min_t, max_t);
//
//        buf[lcd_y * 480 + (offset_x + x)] = color;
//      }
//    }
//
//    lcdUpdateDraw();
//    delay(60);          // 16Hz 정확히
//  }
//}

//void apMain(void)
//{
//  gpioPinMode(0, 1);
//
//  while(1)
//  {
//    //cliMain();
//    if (MLX90640_ReadFrame() == 0)
//    {
//      for (int y = 0; y < MLX_H; y++)
//                  {
//                      for (int x = 0; x < MLX_W; x++)
//                      {
//                          int idx = y * MLX_W + x;
//                          float temp = mlx90640.to[idx];
//
//                          uint16_t color = TempToRGB565_Fixed(temp);
//
//                          // LCD 좌표에 바로 출력 (업스케일 없이)
//                          lcdDrawPixel(x, y, color);
//                      }
//                  }
//      lcdUpdateDraw();
//    }
//
//  }
//}
