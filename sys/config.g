; Configurat; Configuration file for Duet WiFi / Ethernet
; executed by the firmware on start-up

; General preferences
; ############

M111 S0                         ; Debugging off
G21                             ; Work in millimetres
G90                             ; Send absolute coordinates...
M83                             ; ...but relative extruder moves
M555 P2                         ; Set firmware compatibility to look like Marlin

; Network
; ############

M550 P"NibbelsToolChanger"      ; Set machine name
;M587 S"ssid" P"password"       ; WiFi Settings
;M552 S1 P"ssid"                ; Enable WiFi Networking
M552 S1                         ; Enable Networking
M586 P0 S1                      ; Enable HTTP
M586 P1 S0                      ; Disable FTP
M586 P2 S0                      ; Disable Telnet

; Printer Type
; ############

M667 S1                         ; Select CoreXY mode

; Steppers
; ############

; Drive direction and ports
M569 P5 S0                      ; Drive 5 X A         //changed by Nibbels
M569 P6 S0                      ; Drive 6 X B         //changed by Nibbels
M569 P4 S1                      ; Drive 4 Z turned    //changed by Nibbels

M569 P7 S0                      ; Drive 7 COUPLER

M569 P0 S1                      ; Drive 0 E2 turned   //changed by Nibbels
M569 P1 S1                      ; Drive 1 E3 turned   //changed by Nibbels
M569 P8 S0                      ; Drive 8 E1          //changed by Nibbels: Extruder 1 at E5=Stepper8
M569 P9 S0                      ; Drive 9 E0          //changed by Nibbels: Extruder 0 at E6=Stepper9

M569 P2 S0                      ; Drive 2 UNUSED      //changed by Nibbels
M569 P3 S0                      ; Drive 3 UNUSED      //changed by Nibbels

M584 X5 Y6 Z4 C7 E9:8:0:1       ; Apply custom drive mapping  //changed by Nibbels: Extruder 0 at E6=Stepper9, Extruder 1 at E5=Stepper8

; Endstops
M574 X1 S3                                  ; Set X endstop stall detection
M574 Y1 S3                                  ; Set Y endstop stall detection

M574 Z1 S2                                  ; Set Z endstop probe
M558 P5 C"zstop" X0 Y0 Z2 H3 F360 I0 T20000 ; Set Z probe type to switch, the axes for which it is used and the dive height + speeds (RFF3)
G31 P200 X0 Y0 Z0                           ; Set Z probe trigger value, offset and trigger height
M557 X10:290 Y20:180 S40                    ; Define mesh grid
;M376 H15                                   ; bed compensation taper

; Stepper driver
M350 E8:8:8:8 C8 I0                                     ; Configure microstepping without interpolation
M350 X16 Y16 Z16 I1                                     ; Configure microstepping with interpolation
M92 X100 Y100 Z1600 C100 E417:417:417:417               ; Set steps per mm
M906 X2000 Y2000 Z1330 C400 E1680:1680:1680:1680 I30    ; Set motor currents (mA) and motor idle factor in percent
M84 S120                                                ; Set idle timeout

; Stall Detection
M915 C S5 F0 H200 R4700                 ; Coupler
M915 X Y S5 F0 H400 R4700               ; X / Y Axes

; Axis
M208 X-35:328.5 Y-49:243 Z0:300 C0:500 S0           ; Set axis maxima & minima
M566 X400 Y400 Z8 C2 E2:2:2:2                       ; Set maximum instantaneous speed changes (mm/min)
M203 X35000 Y35000 Z1200 C5000 E5000:5000:5000:5000 ; Set maximum speeds (mm/min)
M201 X6000 Y6000 Z400 C500 E2500:2500:2500:2500     ; Set accelerations (mm/s^2)

; Linear Advance
;M572 D0 S0.2                                           ; pressure advance T0
;M572 D1 S0.2                                           ; pressure advance T1
;M572 D2 S0.2                                           ; pressure advance T2
;M572 D3 S0.2                                           ; pressure advance T3

; AAR
M593 F50                                                ; cancel ringing at 50Hz (https://forum.e3d-online.com/threads/accelerometer-and-resonance-measurements-of-the-motion-system.3445/)

; Heated Bed
; ############

M308 S0 A"Bed" P"bedtemp" Y"thermistor" T100000 B4138 C0 ; Set thermistor as sensor 0 (RFF_3)
M950 H0 C"bedheat" T0                                    ; Heater 0 uses the bed_heat pin and sensor 0 (RFF_3)
M143 H0 S225                                             ; Set temperature limit for heater 0 to 225C

; Tool 0
; ############

; create heater
M308 S1 A"T0" P"e0temp" Y"thermistor" R4700 T100000 B4388 ; Set thermistor as sensor 1 (RFF_3)
M950 H1 C"e0heat" T1                                      ; Heater 1 uses the e0_heat pin and sensor 1 (RFF_3)
M143 H1 S300                                              ; Set temperature limit for heater 1 to 300C
; create fan
M950 F0 C"fan1"                                           ; create HE fan 0 on pin fan1 (old P1)
M950 F1 C"fan2"                                           ; create PCF fan 1 on pin fan2 (old P2)
M106 P0 S255 H1 T50                                       ; set T0 HE
M106 P1 S0 H-1                                            ; set T0 PCF. Thermostatic control is turned off
; create tool
M563 P0 S"T0" D0 H1                                       ; Define tool 0 using P:ToolNr, S"ToolName", D:ExtruderDriveNr, H:HeaterNr
G10 P0 X0 Y0 Z0                                           ; Reset tool 0 axis offsets
G10 P0 R0 S0                                              ; Reset initial tool 0 active and standby temperatures to 0C

; Tool 1
; ############

; create heater
M308 S2 A"T1" P"e1temp" Y"thermistor" R4700 T100000 B4388 ; Set thermistor as sensor 2 (RFF_3)
M950 H2 C"e1heat" T2                                      ; Heater 2 uses the e1_heat pin and sensor 2 (RFF_3)
M143 H2 S300                                              ; Reset initial tool 0 active and standby temperatures to 0C
; create fan
M950 F2 C"duex.fan3"                                      ; create HE fan 2 on pin duex.fan3 (old P3)
M950 F3 C"duex.fan4"                                      ; create PCF fan 3 on pin duex.fan4 (old P4)
M106 P2 S255 H2 T50                                       ; set T1 HE
M106 P3 S0 H-1                                            ; set T1 PCF. Thermostatic control is turned off
; create tool
M563 P1 S"T1" D1 H2                                       ; Define tool 1 using P:ToolNr, S"ToolName", D:ExtruderDriveNr, H:HeaterNr
G10 P1 X0 Y0 Z0                                           ; Reset tool 1 axis offsets
G10 P1 R0 S0                                              ; Set temperature limit for heater 2 to 300C

; Tool 2
; ############

; create heater
M308 S3 A"T2" P"duex.e2temp" Y"thermistor" R4700 T100000 B4388 ; Set thermistor as sensor 3 (RFF_3)
M950 H3 C"duex.e2heat" T3                                      ; Heater 3 uses the e2_heat pin and sensor 3 (RFF_3)
M143 H3 S300                                                   ; Reset initial tool 1 active and standby temperatures to 0C
; create fan
M950 F4 C"duex.fan5"                                           ; create HE fan 4 on pin duex.fan5 (old P5)
M950 F5 C"duex.fan6"                                           ; create PCF fan 5 on pin duex.fan6 (old P6)
M106 P4 S255 H3 T50                                            ; set T2 HE
M106 P5 S0 H-1                                                 ; set T2 PCF. Thermostatic control is turned off
; create tool
M563 P2 S"T2" D2 H3                                            ; Define tool 2 using P:ToolNr, S"ToolName", D:ExtruderDriveNr, H:HeaterNr
G10 P2 X0 Y0 Z0                                                ; Reset tool 2 axis offsets
G10 P2 R0 S0                                                   ; Set temperature limit for heater 3 to 300C

; Tool 3
; ############

; create heater
M308 S4 A"T3" P"duex.e3temp" Y"thermistor" R4700 T100000 B4388 ; Set thermistor as sensor 4 (RFF_3)
M950 H4 C"duex.e3heat" T4                                      ; Heater 4 uses the e3_heat pin and sensor 4 (RFF_3)
M143 H4 S300                                                   ; Reset initial tool 2 active and standby temperatures to 0C
; create fan
M950 F6 C"duex.fan7"                                           ; create HE fan 6 on pin duex.fan7 (old P7)
M950 F7 C"duex.fan8"                                           ; create PCF fan 7 on pin duex.fan8 (old P8)
M106 P6 S255 H4 T50                                            ; set T3 HE
M106 P7 S0 H-1                                                 ; set T3 PCF. Thermostatic control is turned off
; create tool
M563 P3 S"T3" D3 H4                                            ; Define tool 3 using P:ToolNr, S"ToolName", D:ExtruderDriveNr, H:HeaterNr
G10 P3 X0 Y0 Z0                                                ; Reset tool 3 axis offsets
G10 P3 R0 S0                                                   ; Reset initial tool 3 active and standby temperatures to 0C

; Tools other settings
; ############

; Tool offsets
G10 P0 X-9 Y39 Z-5                  ; T0
G10 P1 X-9 Y39 Z-5                  ; T1
G10 P2 X-9 Y39 Z-5                  ; T2
G10 P3 X-9 Y39 Z-5                  ; T3

;deselect tools
T-1
