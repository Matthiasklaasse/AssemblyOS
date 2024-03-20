# AssemblyOS Bootloader

This repository contains the bootloader code for AssemblyOS, a custom operating system.

# Memory Table for Bootloader

The following table summarizes the memory allocation used by the bootloader:

| Address | Size | Status | Usage                   |
|---------|------|--------|-------------------------|
| 0x0513  | 0x200| Used   | Bootloader code         |
| 0x0713  | 0x200| Used   | Bootloader data         |
| 0x0913  | 0x100| Used   | Stack                   |
| ...     | ...  | ...    | ...                     |

## Explanation:

- **Address:** The memory address where the allocation starts.
- **Size:** The size of the allocated memory block.
- **Status:** Indicates whether the memory block is currently used or unused.
- **Usage:** Describes the purpose or contents of the memory block.

### Color Values:

| Color         | Value |
|---------------|-------|
| Black         | 0     |
| Blue          | 1     |
| Green         | 2     |
| Cyan          | 3     |
| Red           | 4     |
| Magenta       | 5     |
| Brown         | 6     |
| Light Grey    | 7     |
| Dark Grey     | 8     |
| Light Blue    | 9     |
| Light Green   | 10    |
| Light Cyan    | 11    |
| Light Red     | 12    |
| Light Magenta | 13    |
| Yellow        | 14    |
| White         | 15    |

## Assembler Scripts

### `assembler.py`

This Python script is responsible for assembling the bootloader code and generating the boot image (`bootimage.iso`) in the root directory.

#### Usage:

1. Ensure you have the necessary assembler tool installed on your system.
2. Modify the `assemble_bin` function in `assembler.py` to specify the command for assembling your bootloader code.
3. Run `python assembler.py` to assemble the bootloader code and generate the boot image.
4. The assembled boot image (`bootimage.iso`) will be saved in the root directory.

### `assemble_server.py`

This Python script acts as a server that continuously monitors changes to the bootloader code and updates the `bootimage.iso` file whenever a change is detected.

#### Usage:

1. Run `python assemble_server.py` to start the monitoring server.
2. Any changes made to the bootloader code will automatically trigger the assembly process, ensuring that the `bootimage.iso` file remains up-to-date.

## Tools

The `tools` directory contains additional utilities and scripts used in the AssemblyOS project. No additional tools are required beyond those located in the `tools` directory.

## Additional Information

- Both scripts have been tested on Windows 10 and 11.
- The operating system works in VirtualBox, but bare metal installation has not been tested yet. Other virtual machine environments have not been tested.
- For any issues or suggestions, please open an issue in this repository.\
- yes this was written by chatGPT cuz im lazy