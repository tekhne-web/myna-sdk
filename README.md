# TEKHNĒ MYNA Standalone SDK (v1.3.2)

## Release Notes

Please refer to the [Release Notes](https://github.com/newracom/nrc7394_sdk/blob/master/package/RN-7394-002-Standalone%20SDK%20release_note%20(v1.3.2).pdf) document to learn about the list of features/issues changes that are added at this release.


## Getting Started

To simplify the development of embedded applications within the internal memory of the MYNA modules, a Docker image is available with all the necessary features to compile and program the different applications.

To do this, the following steps must be followed:

1. If you do not have Docker installed in your work environment, you can do so by following the instructions detailed at https://www.docker.com/.

2. Run the following command to create the image from the Dockerfile:

    ```
    make builder-build
    ```

3. Finally, once the image has been created, run the following command:

    ```
    make builder-run
    ```

From this point on, an interactive shell session will have opened from which you can execute the relevant commands.

### Updating Wi-Fi HaLow Module RF files

> [!CAUTION]
> The default SDK does not have the necessary RF calibration files to operate with the MYNA modules.     
Therefore, it is required that these files be updated before starting to work with the SDK.  

To do this, you must first clone the repository that contains the RF parameter information of the modules.

```
git clone https://github.com/tekhne-web/wifi-halow-modules
```

Next, the corresponding RF parameters file must be overwritten (located in `sdk/package/bdf/nrc7394/nrc7394_bd.dat`).

For example, to use the MYNA EU8D variant with internal antenna, the following command must be executed:

```
cp wifi-halow-modules/myna/eu8d/bdf/myna_eu8d_int_ant.dat sdk/package/bdf/nrc7394/nrc7394_bd.dat
```

## Configuration Options

TEKHNĒ Wi-Fi HaLow Modules supports 3 different ways to interact with it:

- AT Commands
- Standalone (Open CPU)
- Host mode (Linux Driver)

### 1. AT Commands

AT command firmware can be used through 3 different interfaces:

- UART without HFC (**ATCMD_UART.bin**): The maximum baud rate is 115,200bps, 8N1.
- UART with HFC using RTS/CTS signaling (**ATCMD_UART_HFC.bin**): The maximum frequency is 2MHz, 8N1.
- HSPI with optional IRQ signal (**ATCMD_HSPI.bin**): The maximum clock frequency is 20MHz.

> **NOTE**: MYNA modules are pre-flashed with the ATCMD_UART.bin binary file.

Please refer to **section 2.3.3** of the [Standalone SDK](https://github.com/newracom/nrc7394_sdk/blob/v1.3.2/package/doc/UG-7394-004-Standalone%20SDK.pdf) to learn more about how to compile and flash the different AT command firmware files onto the module.

For a detailed list of the set of AT commands that can be used please refer to the  [AT Command Guide](https://github.com/newracom/nrc7394_sdk/blob/v1.3.2/package/doc/UG-7394-006-AT_Command.pdf).

### 2. Standalone (Open CPU)

In this mode, the application that the user flashes within the module's flash memory coexists with the Wi-Fi HaLow communications stack.

In order to interact with the wireless stack, a specific API must be used from within the user's application. Please refer to the [SDK API Guide](https://github.com/newracom/nrc7394_sdk/blob/v1.3.2/package/doc/UG-7394-005-Standalone%20SDK%20API.pdf) for details  about the different functionalities and features provided by the SDK.

Please refer to the [Standalone SDK Guide](https://github.com/newracom/nrc7394_sdk/blob/v1.3.2/package/doc/UG-7394-004-Standalone%20SDK.pdf) to learn more about how to compile and flash custom firmware files onto the module.

### 3. Host mode (Linux Driver)

Please refer to [MYNA Host Mode](https://github.com/tekhne-web/myna-linux-host-mode) repository to learn more about how to compile and use the Linux driver.
