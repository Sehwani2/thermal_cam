
#include "MLX90640_I2C_Driver.h"

#ifdef _USE_HW_MLX90640

extern I2C_HandleTypeDef hi2c4;


void MLX90640_I2CInit()
{

}


int MLX90640_I2CRead(uint8_t slaveAddr, uint16_t startAddress, uint16_t nMemAddressRead, uint16_t *data)
{
    int ack = 0;
    int cnt = 0;


    ack = HAL_I2C_Mem_Read(&hi2c4,
                           (slaveAddr << 1),
                           startAddress,
                           I2C_MEMADD_SIZE_16BIT,
                           (uint8_t*)data,
                           nMemAddressRead * 2,
                           500);

    if (ack != HAL_OK)
    {
        return -1;
    }

    // 16비트 단위로 엔디안 변환 (빅엔디안 → 리틀엔디안)
    uint16_t *p16 = data;
    for (cnt = 0; cnt < nMemAddressRead; cnt++)
    {
        p16[cnt] = (p16[cnt] >> 8) | (p16[cnt] << 8);
    }

    return 0;
}



int MLX90640_I2CWrite(uint8_t slaveAddr, uint16_t writeAddress, uint16_t data)
{
    uint8_t sa;
    int ack = 0;
    uint8_t cmd[2];
    uint16_t dataCheck;

    sa = (slaveAddr << 1);

    cmd[0] = data >> 8;       // 상위 바이트
    cmd[1] = data & 0xFF;     // 하위 바이트

    // 쓰기
    ack = HAL_I2C_Mem_Write(&hi2c4, sa, writeAddress, I2C_MEMADD_SIZE_16BIT, cmd, sizeof(cmd), 500);
    if (ack != HAL_OK)
    {
        return -1; // 쓰기 실패
    }

    //
    MLX90640_I2CRead(slaveAddr, writeAddress, 1, &dataCheck);
    if (dataCheck != data)
    {
        return -2; // 데이터 불일치
    }

    return 0; // 성공
}



#endif
