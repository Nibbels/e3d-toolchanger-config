# RepRapFirmware SD
Nibbels RRF3 configuration files for the Motion System &amp; ToolChanger.
My firmware is: 
````
Board: Duet 2 WiFi (2WiFi) 
Firmware: RepRapFirmware for Duet 2 WiFi/Ethernet 3.1.1 (2020-05-19b2) 
Duet WiFi Server Version: 1.23 
Duet Web Control 3.1.1 
````

Copy onto the Micro SD Card and insert into the Duet2 before power on.

You may need to check the config.g file to make changes for use on your own Network.
I always use the Tool Changer post-processing script to print.
https://github.com/mkudzia84/toolchanger-pspp

###### Warning ######
I did change the stepper ports on which the steppers are connected. -> See config.g in the upper part.

- The Speeds and Accelerations have been lowered for DirectDrives but they still have to be tuned in.
- I did change the tool selection / preheat / purge because I park my tools on razorblades.
- Implementing partfans is still a Todo. The PCF configuration should be fine but it has never been tested.
- The Crashdetection of the coupler drive first worked but doesnt rightnow. It has to be retuned to habe a faster C-Homing. Check if your coupler is at horizontal position / vertical position if opened or closed! Otherwise adjust it.
###### ####### ######

THIS REPO IS A CONSTANT DEVELOPMENT AND I CANNOT GUARANTEE THAT THE FILES WORK FOR YOU. USE THEM WISELY.


https://duet3d.dozuki.com/c/RepRapFirmware

https://duet3d.dozuki.com/Wiki/Gcode

Make sure you have the lastest firmware installed | https://github.com/dc42/RepRapFirmware/releases   
