<!-- Debugger.md -->
# Debugger

Debugger ref [here](https://github.com/X16Community/x16-emulator/blob/e4ce4c3598ae37a9313803a6cb42b37878350793/README.md?plain=1#L337)

Video: Commander X16 - Using the 6502 Assembly Dev Tools [here](https://www.youtube.com/watch?v=dCLyXvtNixY&ab_channel=Spriteworx)

--------
![debug](images\debug.png)
Figure 1 Screenshot of debug

In the command line of the emulator add `-debug` to start the debugger otherwise it is disabled.

There are 2 panels you can control. The code panel, the top left half, and the data panel, the bottom half of the screen. You can also edit the contents of the registers PC, A, X, Y, and SP.

The debugger uses its own command line with the following syntax:

|Statement|Description|
|---------|----------------------------------------------------------------------------------------------------|
|d %x|Change the code panel to view disassembly starting from the address %x.|
|m %x|Change the data panel to view memory starting from the address %x.|
|v %x|Display VERA RAM (VRAM) starting from address %x.|
|b %s %d|Changes the current memory bank for disassembly and data. The %s param can be either 'ram' or 'rom', the %d is the memory bank to display (but see NOTE below!).|
|r %s %x|Changes the value in the specified register. Valid registers in the %s param are 'pc', 'a', 'x', 'y', and 'sp'. %x is the value to store in that register.|

NOTE. To disassemble or dump memory locations in banked RAM or ROM, prepend the bank number to the address; for example, "m 4a300" displays memory contents of BANK 4, starting at address $a300.  This also works for the 'd' command.

The debugger keys are similar to the Microsoft Debugger shortcut keys, and work as follows

| Key       | Description                                                                             |
|-----------|-----------------------------------------------------------------------------------------|
| F1        | resets the shown code position to the current PC                                        |
| F2        | resets the 65C02 CPU but not any of the hardware.                                       |
| F5        | close debugger window and return to Run mode, the emulator should run as normal.        |
| F9        | sets the breakpoint to the currently code position.                                     |
| F10       | steps 'over' routines - if the next instruction is JSR it will break on return.         |
| F11       | steps 'into' routines.                                                                  |
| F12       | is used to break back into the debugger. This does not happen if you do not have -debug |
| PAGE UP   | is used to scroll up in the debugger.                                                   |
| PAGE DOWN | is used to scroll down in the debugger.                                                 |
| TAB       | when stopped, or single stepping, hides the debug information when pressed              |

When `-debug` is selected the STP instruction (opcode $DB) will break into the debugger automatically.

Keyboard routines only work when the emulator is running normally. Single stepping through keyboard code will not work at present.
