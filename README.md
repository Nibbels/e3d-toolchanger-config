# RepRapFirmware SD
Nibbels RRF3 configuration files for the Motion System &amp; ToolChanger.
My firmware is: 
````
Board: Duet 2 WiFi (2WiFi)
Firmware: RepRapFirmware for Duet 2 WiFi/Ethernet 3.4.6 (2023-07-21)
Duet WiFi Server Version: 1.27
````

Copy onto the Micro SD Card and insert into the Duet2 before power on.
You may need to check the config.g file to make changes for use on your own Network.

This is a Tool Changer post-processing script to print:
https://github.com/mkudzia84/toolchanger-pspp
-> In newer prusa 2.5.0 / 2.6.1 the post processing script has some flaws. It does not work anymore.

I am currently looking for ways
-> to print without filament configuration in the slicer (see active and standby temperatures) I want the filament configuration in the toolchanger to deal with it. Then I can swap filaments without changing gcodes - hopefully.
-> to have automatic z-leveling per tool head - The leveling of the exact z-offset is a pain i think.
-> to have a simple way to disable unneeded tool heads per print.

###### Warning ######
I did change the stepper ports on which the steppers are connected. -> See config.g in the upper part.

- The Speeds and Accelerations have been lowered for DirectDrives but they still have to be tuned in.
- I did change the tool selection / preheat / purge because I park my tools on razorblades.
- Implementing partfans is still a Todo. The PCF configuration should be fine but it has never been tested.
- The Crashdetection of the coupler drive first worked but doesnt rightnow. It has to be retuned to habe a faster C-Homing. Check if your coupler is at horizontal position / vertical position if opened or closed! Otherwise adjust it.
###### ####### ######

THIS REPO IS A CONSTANT DEVELOPMENT AND I CANNOT GUARANTEE THAT THE FILES WORK FOR YOU. USE THEM WISELY.

[https://duet3d.dozuki.com/Wiki/Gcode](https://docs.duet3d.com/User_manual/Reference/Gcodes)
[https://github.com/dc42/RepRapFirmware/releases](https://github.com/Duet3D/RepRapFirmware/releases)
