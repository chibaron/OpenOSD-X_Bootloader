<p align="right">
  <a href="./README.md">English</a>
</p>

# OpenOSD-X Bootloader

OpenOSD-X用のbootloaderです

### 機能
- 書き込まれたOpenOSD-Xのファームを検証し正常であれば起動します
- 異常な場合はbootloadのコマンドモード(UART)で起動します
- openBootloaderを改変したものであり、多くのコマンドが使用できます
  https://github.com/STMicroelectronics/stm32-mw-openbl
