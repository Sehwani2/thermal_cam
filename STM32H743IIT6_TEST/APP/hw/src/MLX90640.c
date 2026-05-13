#ifdef __cplusplus
extern "C" {
#endif

#include "MLX90640.h"
#include "MLX90640_API.h"
#include "lcd.h"
#include "lcd/thermal_palette_common.h"
#include "lvgl/lvgl_ui.h"
#ifdef _USE_HW_MLX90640

///
#define MINMAX_UPDATE_INTERVAL  2048
float global_min_temp = 20.0f;
float global_max_temp = 40.0f;
static uint32_t update_counter = 0;
uint8_t minmax_update_flag = 0;
///
#define  FPS2HZ   0x02
#define  FPS4HZ   0x03
#define  FPS8HZ   0x04
#define  FPS16HZ  0x05
#define  FPS32HZ  0x06

#define  MLX90640_ADDR 0x33

#define  REFRESHRATE FPS16HZ
#define  TA_SHIFT 8 //Default shift for MLX90640 in open air
#define MLX90640_EMISSIVITY 0.95f

MLX90640_HandleTypeDef mlx90640 __attribute__((section(".mlx90640"), aligned(64)));



int MLX90640_Init()
{
    mlx90640.emissivity  = MLX90640_EMISSIVITY;
    mlx90640.Ta_shift    = TA_SHIFT;
    mlx90640.refreshRate = REFRESHRATE;

    // Refresh Rate, Mode 설정
    MLX90640_SetRefreshRate(MLX90640_ADDR, mlx90640.refreshRate);
    MLX90640_SetChessMode(MLX90640_ADDR);

    // EEPROM 읽기 및 파라미터 추출
    int status;

    status = MLX90640_DumpEE(MLX90640_ADDR, mlx90640.eeData);
    if(status != 0) return status;

    status = MLX90640_ExtractParameters(mlx90640.eeData, &mlx90640.params);
    if(status != 0) return status;

    return 0;
}

int MLX90640_ReadFrame()
{
    int status = MLX90640_GetFrameData(MLX90640_ADDR, mlx90640.frame);
    if(status < 0) return status;

    float vdd = MLX90640_GetVdd(mlx90640.frame, &mlx90640.params);
    float Ta  = MLX90640_GetTa(mlx90640.frame, &mlx90640.params);
    float tr  = Ta - mlx90640.Ta_shift;

    MLX90640_CalculateTo(mlx90640.frame, &mlx90640.params, mlx90640.emissivity, tr, mlx90640.to);

    return 0;
}


//uint16_t TempToRGB565(float temp, float min_temp, float max_temp)
//{
//    if (temp <= min_temp) return thermal_colormap[0];
//    if (temp >= max_temp) return thermal_colormap[255];
//
//    float normalized = (temp - min_temp) / (max_temp - min_temp);
//    int color_index = (int)(normalized * 255.0f + 0.5f);
//
//    if (color_index < 0) color_index = 0;
//    if (color_index > 255) color_index = 255;
//
//    return thermal_colormap[color_index];
//}

uint16_t TempToRGB565(float temp)
{
    if (++update_counter >= MINMAX_UPDATE_INTERVAL)
    {
        update_counter = 0;
        global_min_temp = mlx90640.to[0];
        global_max_temp = mlx90640.to[0];

        for(int i=1; i<768; i++)
        {
            if (mlx90640.to[i] < global_min_temp) global_min_temp = mlx90640.to[i];
            if (mlx90640.to[i] > global_max_temp) global_max_temp = mlx90640.to[i];
        }

        // 최소 5도 차이 보장
        if (global_max_temp - global_min_temp < 5.0f)
        {
            float center = (global_max_temp + global_min_temp) * 0.5f;
            global_min_temp = center - 2.5f;
            global_max_temp = center + 2.5f;
        }
        minmax_update_flag = 1;
    }


    const uint16_t* colormap = get_current_palette();

    // 2. 정규화 및 컬러맵 적용
    if (temp <= global_min_temp)
    {
      return colormap[0];
    }
    if (temp >= global_max_temp)
    {
      return colormap[255];
    }

    float ratio = (temp - global_min_temp) / (global_max_temp - global_min_temp);
    int idx = (int)(ratio * 255.0f + 0.5f);

    return colormap[idx];
}



uint16_t TempToRGB565_Fixed(float temp)
{
    const uint16_t* colormap = get_current_palette();

    if (temp <= mlx90640.min_temp)
    {
      return colormap[0];
    }
    if (temp >= mlx90640.max_temp)
    {
      return colormap[255];
    }

    float normalized = (temp - mlx90640.min_temp) / (mlx90640.max_temp - mlx90640.min_temp);
    int color_index = (int)(normalized * 255.0f + 0.5f);

    return colormap[color_index];
}

//void BilinearInterpolate_MLX90640(float *src, uint16_t *dst, int scale, bool flip_horizontal)
//{
//    int CANVAS_W = MLX_W * scale;
//    int CANVAS_H = MLX_H * scale;
//
//    for (int y = 0; y < CANVAS_H; y++)
//    {
//        float src_y = ((float)y / (CANVAS_H - 1)) * (MLX_H - 1);
//        int y0 = (int)src_y;
//        int y1 = y0 + 1;
//        if (y1 >= MLX_H) y1 = MLX_H - 1;
//        float fy = src_y - y0;
//
//        for (int x = 0; x < CANVAS_W; x++)
//        {
//            float src_x = ((float)x / (CANVAS_W - 1)) * (MLX_W - 1);
//            int x0 = (int)src_x;
//            int x1 = x0 + 1;
//            if (x1 >= MLX_W) x1 = MLX_W - 1;
//            float fx = src_x - x0;
//
//            float v00 = src[y0 * MLX_W + x0];
//            float v01 = src[y0 * MLX_W + x1];
//            float v10 = src[y1 * MLX_W + x0];
//            float v11 = src[y1 * MLX_W + x1];
//
//            float interp = (1 - fx) * (1 - fy) * v00 +
//                           fx * (1 - fy) * v01 +
//                           (1 - fx) * fy * v10 +
//                           fx * fy * v11;
//
//            int dst_x = flip_horizontal ? (CANVAS_W - 1 - x) : x;
//            dst[y * CANVAS_W + dst_x] = TempToRGB565_Fixed(interp);
//        }
//    }
//}
void BilinearInterpolate_MLX90640(const float *src,
                                       uint16_t *dst,
                                       int scale,
                                       bool flip_horizontal)
{
    const int dst_w = MLX_W * scale;
    const int dst_h = MLX_H * scale;

    // 고정소수점 8비트 (256 = 1.0)
    const uint32_t SCALE_X = ((MLX_W) << 8) / dst_w;
    const uint32_t SCALE_Y = ((MLX_H) << 8) / dst_h;

    for (int dy = 0; dy < dst_h; dy++)
    {
        uint32_t sy_fixed = dy * SCALE_Y;
        int      sy       = sy_fixed >> 8;
        uint32_t fy       = sy_fixed & 0xFF;        // 0~255

        int src_y0 = sy * MLX_W;
        int src_y1 = (sy + 1 < MLX_H) ? (sy + 1) * MLX_W : src_y0;

        int dst_row = dy * dst_w;

        for (int dx = 0; dx < dst_w; dx += 2)
        {
            // 현재 픽셀
            uint32_t sx_fixed  = dx * SCALE_X;
            int      sx        = sx_fixed >> 8;
            uint32_t fx        = sx_fixed & 0xFF;

            // 다음 픽셀
            uint32_t sx_fixed2 = (dx + 1) * SCALE_X;
            int      sx2       = sx_fixed2 >> 8;
            uint32_t fx2       = sx_fixed2 & 0xFF;

            // 경계 처리
            int x0  = sx;   int x1  = (sx  + 1 < MLX_W) ? sx  + 1 : sx;
            int x02 = sx2;  int x12 = (sx2 + 1 < MLX_W) ? sx2 + 1 : sx2;

            const float *p0 = src + src_y0;
            const float *p1 = src + src_y1;

            float v00 = p0[x0];    float v01 = p0[x1];
            float v10 = p1[x0];    float v11 = p1[x1];
            float v00_2 = p0[x02]; float v01_2 = p0[x12];
            float v10_2 = p1[x02]; float v11_2 = p1[x12];

            // 고정소수점 보간 (float 곱셈 0)
            int t1 = (int)(v00 * 256 + fx * (v01 - v00) + 128) >> 8;
            int t2 = (int)(v10 * 256 + fx * (v11 - v10) + 128) >> 8;
            int result1 = (t1 * (256 - fy) + t2 * fy + 128) >> 8;

            int t1_2 = (int)(v00_2 * 256 + fx2 * (v01_2 - v00_2) + 128) >> 8;
            int t2_2 = (int)(v10_2 * 256 + fx2 * (v11_2 - v10_2) + 128) >> 8;
            int result2 = (t1_2 * (256 - fy) + t2_2 * fy + 128) >> 8;

            // 좌우 반전
            int out_x1 = flip_horizontal ? (dst_w - 1 - dx)     :  dx;
            int out_x2 = flip_horizontal ? (dst_w - 2 - dx)     : (dx + 1);

            if(mlx90640.auto_temp == 0 )
            {
              dst[dst_row + out_x1] = TempToRGB565((float)result1);
              dst[dst_row + out_x2] = TempToRGB565((float)result2);
            }
            else
            {
              dst[dst_row + out_x1] = TempToRGB565_Fixed((float)result1);
              dst[dst_row + out_x2] = TempToRGB565_Fixed((float)result2);
            }

        }
    }
}


#ifdef __cplusplus
}
#endif

#endif
