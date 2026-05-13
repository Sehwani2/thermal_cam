# STM32H7 Thermal Camera

STM32H7 기반 Thermal Camera 프로젝트
- LX90640 적외선 센서 데이터 온도 데이터를 LCD에 Heatmap 형태로 출력
- 32x24의 낮은 thermal resolution 데이터를 interpolation 하여 thermal image를 구현
- 추가적으로 OV7670 카메라 모듈 포팅 및 CMSIS-DSP 기반 DSP 실험도 진행
<img width="300" height="200" alt="IMG_5859" src="https://github.com/user-attachments/assets/a41d40a5-ac99-4031-9def-8421b52a43d0" />
<img width="300" height="200" alt="IMG_5858" src="https://github.com/user-attachments/assets/4fe79da8-e554-4465-9984-59f6a6792f24" />

---

## Project Goals

- MLX90640 기반 Thermal Camera 구현
- STM32H7 Carrier PCB 제작
- LCD에 Thermal Heatmap 및 간단한 UI 출력
- 저해상도 thermal image 업스케일링
- OV7670 카메라 포팅
- CMSIS-DSP 기반 BPM 데이터 추출 테스트

---

## Features

- MLX90640 Thermal Sensor Interface
- Thermal Heatmap Rendering
- Bilinear Interpolation Upscaling
- SPI LCD Display
- OV7670 Camera Bring-up
- LVGL-based UI
- CMSIS-DSP FFT Experiment

---

## Hardware

- STM32H7 Development Board
- MLX90640 Module
- OV7670 Camera Module
- 480x320 SPI LCD with Touch
- Custom STM32H7 Carrier PCB

---

## img
<img width="300" height="200" alt="IMG_5862" src="https://github.com/user-attachments/assets/25bb59ad-c86e-4a2f-9c5b-440c7c1bc2f1" />
<img width="300" height="200" alt="main" src="https://github.com/user-attachments/assets/aeacfbe0-82c1-4b9b-a08c-c4e2b5af78ca" />
<img width="300" height="200" alt="ov7670" src="https://github.com/user-attachments/assets/8e0eb4c3-1204-43c9-bee3-9fd6ae7cd20f" />
<img width="300" height="200" alt="mlx90640_1" src="https://github.com/user-attachments/assets/de014726-b0e4-4673-b7c4-4c3649844d45" />
<img width="300" height="200" alt="auto_range" src="https://github.com/user-attachments/assets/5ded769a-0817-4378-a54c-a6732bcbe403" />
<img width="300" height="200" alt="setting_page" src="https://github.com/user-attachments/assets/2947fe8f-f27c-4126-8f55-59ce80472451" />
<img width="300" height="200" alt="bpm" src="https://github.com/user-attachments/assets/29f6a612-3d63-4a09-b5db-193c5de18651" />


## Future Work

- Battery 기반 Custom Board 제작
- Parallel RGB LCD 적용
- FMC 기반 LCD 인터페이스 적용
- Thermal / Camera Overlay
- Higher FPS Thermal Sensor 적용
- GUI 개선
- Thermal Image Optimization
- 실시간 BPM 측정으로 변경(그래프화)
- OV7670기반 green img 기반 BPM 추출
