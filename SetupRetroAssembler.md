# Commander x16 and Retro Assembler

## Download Microsoft VS Code and install

download VS Code [here](https://code.visualstudio.com/)

[ref here](https://www.8bitcoding.com/p/assembly-in-basic-i-setting-up.html)

## Download retro assembler

[download retro assembler here ](https://enginedesigns.net/)
unzip the file
add the location of the files to path


## Creating a user settings file

in the retro assembler direectory 

copy the file retroassembler-settings.xml
rename this copy to retroassembler-usersettings.xml

modify the settings to the following:
```

	<Setting Name="CpuType" Type="String" Value="65C02" />
	<Setting Name="OutputFileType" Type="String" Value="prg" />
	<Setting Name="AfterBuild" Type="String" Value="copy.bat" />
	<Setting Name="LaunchCommand" Type="String"Value="path_to\x16emu.exe -scale 2 -quality nearest -prg {0}" />
 	<Setting Name="DebugCommand" Type="String" Value="path_to\x16emu.exe -scale 1 -quality nearest -debug -prg {0}" />

```
change the path_to\ to the path to the emulator

Five settings have the following meanings:

**CpuType**	we want to take advantage of additional instructions and addressing modes so we want compiler to recognize code as 65C02. If we in the future get 65816 in Commander X16 we can change this to support even more features of that CPU. I am still hoping we will get it J

**OutputFileType**  by default the output file is of type bin. The only difference between these two types is that files of .prg type contain the target address where to be loaded into memory so we can use simple LOAD and the system will know where in memory to put it.

**AfterBuild**  here we can define a command that will be called after compiler successfully builds the program. We will use this to start a very simple script to copy the finished program into the emulator directory. In my case the copy.bat program contains only one line:
```
copy /B /Y Program.prg path_to\[Emulator]

```
Of course you will have to change the name of the program depending on the source code name you are compiling and the directory wherever you put the emulator. I decided to put a copy.bat script in every root folder of my every project so this settings can stay the same regardless which project I am compiling.

**LaunchCommand** is the command that is used to launch emulator automatically and start/load the compiles assembly program. As before the path to the emulator might be different depending on where you installed the emulator on your system. The option –prg {0} is responsible for injecting full path to the resulting prg file. Note that we are starting the prg directly from the location where we built it and not the copy of it that was transferred to emulator directory with the “AfterBuild” script.

**DebugCommand** is the command that is used to launch emulator with the -debug automatically and start/load the compiles assembly program.

It is important to mention one setting that we didn’t change because it is affecting the behavior:

LaunchEnabled – stayed set to False in the default settings. Reason for it is that this way we have an option to either just build and copy assembly program or build and start it from the editor. This is done by overriding this setting inside the Visual Studio Code Keyboard shortcut setting.

## Retro assembler extension

to add retro assembler extension to Visual Studio code
goto the extensions tab on the left or ctrl+shift+x
do a search for "retro assemble" and install the extension

## After downloading extension

### Add keyboard shortcuts

goto File-->preferences-->keyboard shortcuts or ctrl + k ctrl + s
do a search for "retro"

  To change, select a command and press enter 
  then a key. This allows to change the keybinding.

build only
under "command": "retroassembler.build"  "key": "f4",
  
  }build nd debug
  "command": "retroassembler.builddebug"  "key": "shift+f5",

  "command": "retroassembler.buildstart"   "key": "f5",

}build nd run
  "command": "retroassembler.buildstart"   "key": "f6"

