

#ifndef MLX90640_I2C_DRIVER_H_
#define MLX90640_I2C_DRIVER_H_

#include "hw_def.h"

#ifdef _USE_HW_MLX90640

void MLX90640_I2CInit(void);
int  MLX90640_I2CRead(uint8_t slaveAddr,uint16_t startAddress, uint16_t nMemAddressRead, uint16_t *data);
int  MLX90640_I2CWrite(uint8_t slaveAddr,uint16_t writeAddress, uint16_t data);


#endif

#endif /* HW_INCLUDE_MLX90640_I2C_DRIVER_H_ */


