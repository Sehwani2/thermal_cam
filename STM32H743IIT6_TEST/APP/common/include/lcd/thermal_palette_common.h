// thermal_palette_common.h
#ifndef THERMAL_PALETTE_COMMON_H
#define THERMAL_PALETTE_COMMON_H

#include <stdint.h>

#define PALETTE_WIDTH   20
#define PALETTE_HEIGHT  256

typedef enum {
    PALETTE_PLASMA = 0,
    PALETTE_RAINBOW,
    PALETTE_VIRIDIS,
    PALETTE_HOT,
    PALETTE_SEISMIC,
    PALETTE_BLACKHOT,
    PALETTE_WHITEHOT,
    PALETTE_HOTCOLD,
    PALETTE_COUNT
} palette_t;

// 2. extern 선언들
extern palette_t current_palette;
extern const uint16_t thermal_colormap_plasma[256];
extern const uint16_t thermal_colormap_rainbow[256];
extern const uint16_t thermal_colormap_viridis[256];
extern const uint16_t thermal_colormap_hot[256];
extern const uint16_t thermal_colormap_seismic[256];
extern const uint16_t thermal_colormap_hotspot[256];
extern const uint16_t thermal_colormap_coldspot[256];
extern const uint16_t thermal_colormap_hotcold[256];

extern uint16_t palette_img_buf[];

void palette_generate(void);
void *colorbarGetFrameBuffer(void);
// 3. static inline 함수 정의
static inline const uint16_t* get_current_palette(void)
{
    switch (current_palette) {
        case PALETTE_PLASMA:   return thermal_colormap_plasma;
        case PALETTE_RAINBOW:   return thermal_colormap_rainbow;
        case PALETTE_VIRIDIS:      return thermal_colormap_viridis;
        case PALETTE_HOT:      return thermal_colormap_hot;
        case PALETTE_SEISMIC:    return thermal_colormap_seismic;
        case PALETTE_BLACKHOT:  return thermal_colormap_hotspot;
        case PALETTE_WHITEHOT:  return thermal_colormap_coldspot;
        case PALETTE_HOTCOLD:   return thermal_colormap_hotcold;
        default:                return thermal_colormap_plasma;
    }
}

#endif
