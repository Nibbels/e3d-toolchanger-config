; Configuration file for Duet WiFi / Ethernet running RRF3 on E3D Tool Changer
; executed by the firmware on start-up

; WARNING: Steppers are connected at other locations:
; - Z    at E4 Driver
; - X(A) at E5 Driver
; - X(B) at E6 Driver
; - C    at E3 Driver
; - E0   at E9 Driver
; - E1   at E8 Driver
; - E2   at E7 Driver
; - E3   at E1 Driver / still unconnected untested.

; General preferences
; ############

M111 S0                         ; Debugging off
G21                             ; Work in millimetres
G90                             ; Send absolute coordinates...
M83                             ; ...but relative extruder moves
M555 P2                         ; Set firmware compatibility to look like Marlin

; Network
; ############

M550 P"ToolChanger"             ; Set machine name
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

M569 P3 S0                      ; Drive 3 COUPLER

M569 P1 S1                      ; Drive 1 E3 turned   //changed by Nibbels
M569 P7 S1                      ; Drive 7 E2 turned   //changed by Nibbels
M569 P8 S0                      ; Drive 8 E1          //changed by Nibbels
M569 P9 S0                      ; Drive 9 E0          //changed by Nibbels

M569 P2 S0                      ; Drive 2 UNUSED      //changed by Nibbels -- motor phase a disconnected, might the port be broken?
M569 P0 S0                      ; Drive 0 UNUSED      //changed by Nibbels

M584 X5 Y6 Z4 C3 E9:8:7:1       ; Apply custom drive mapping

; Endstops
M574 X1 S3                                   ; Set X endstop stall detection
M574 Y1 S3                                   ; Set Y endstop stall detection

M574 Z0 P"nil"                               ; No Z endstop @used by DC42 using G30 homing
M558 P8 C"zstop" H5 F120 T10000 A5 S0.01     ; Set Z probe 0 type to switch, the axes for which it is used and the dive height + speeds @DC42
G31 Z0                                       ; Set Z probe trigger value, offset and trigger height
M557 X4:292 Y4:185 S16:15                    ; Set Z probe 0: Define mesh grid

M558 P8 C"!e1stop" H5 F120 A5 S0.01 B1 K1    ; Set Z probe 1: For nozzle leveling

M574 C1 S3                                   ; Stall detect coupler at low end of its range

; Stepper driver
M350 E16:16:16:16 I1                                    ; Configure E microstepping with interpolation
M350 C8 I0                                              ; Configure C microstepping with interpolation
M350 X16 Y16 Z16 I1                                     ; Configure XYZ microstepping with interpolation

M92 X100 Y100 Z1600 C100 E834:834:409:409               ; Set steps per mm
M906 X1600 Y1600 Z1100 C400 E900:900:900:900 I30        ; Set motor currents (mA) and motor idle factor in percent
                                                        ; Compact but Powerfull: datasheed 1,68 A -> rounded to 1,6A @ E0 E1 E2 E3
                                                        ; Slimline:              datasheed 1,4  A
M84 S120                                                ; Set idle timeout

; Stall Detection
M915   C S4 F1 H400 R0                    ; Coupler
M915 X Y S3 F0 H400 R0                    ; X / Y Axes

; Axis
M208 X-35:328.5 Y-60:232 Z0:280 C0:240 S0           ; Set axis maxima & minima
M566 X300 Y300 Z20 C2 E100:100:150:150              ; Set maximum instantaneous speed changes (mm/min)
M203 X15000 Y15000 Z1200 C5000 E5000:5000:5000:5000 ; Set maximum speeds (mm/min)
M201 X2500 Y2000 Z500 C500 E2500:2500:2500:2500     ; Set accelerations (mm/s^2)

; AAR
;M593 P"zvd" F50 FW3.4+
M593 F50                                                ; cancel ringing at 50Hz (https://forum.e3d-online.com/threads/accelerometer-and-resonance-measurements-of-the-motion-system.3445/)
M376 H0                                                 ; bed compensation taper, Ausschleichhöhe

; Bed and Tools
; ############

; Heaters
M308 S0 P"bedtemp" Y"thermistor" A"Bed" T100000 B4138 C0   ; Set thermistor 
M950 H0 C"bedheat" T0                                      ; Bed heater
M140 H0                                                    ; Add heater to bed after RRF3.01 RC10
M143 H0 S120                                               ; Set temperature limit for heater 0 to 225C

M308 S1 P"e0temp" Y"thermistor" A"T0" T100000 B4725 C7.06e-8 ; Set thermistor
M950 H1 C"e0heat" T1                                         ; Extruder 0 heater
M143 H1 S300                                                 ; Set temperature limit for heater 1 to 300C
M307 H1 A718.2 C234.2 D4.0 S1.00 V24.3 B0

M308 S2 P"e1temp" Y"thermistor" A"T1" T100000 B4725 C7.06e-8 ; Set thermistor
M950 H2 C"e1heat" T2                                         ; Extruder 0 heater
M143 H2 S300                                                 ; Set temperature limit for heater 2 to 300C
M307 H2 A489.9 C207.8 D2.9 S1.00 V24.3 B0

M308 S3 P"e2temp" Y"thermistor" A"T2" T100000 B4725 C7.06e-8 ; Set thermistor
M950 H3 C"duex.e2heat" T3                                    ; Extruder 0 heater
M143 H3 S300                                                 ; Set temperature limit for heater 3 to 300C
M307 H3 A504.4 C247.8 D1.6 S1.00 V24.3 B0

M308 S4 P"e3temp" Y"thermistor" A"T3" T100000 B4725 C7.06e-8 ; Set thermistor
M950 H4 C"duex.e3heat" T4                                    ; Extruder 0 heater
M143 H4 S300                                                 ; Set temperature limit for heater 4 to 300C
M307 H4 A776.8 C166.9 D2.6 S1.00 V24.3 B0

; Tools
M563 P0 S"T0 0.3 285" D0 H1 F2          ; Define tool 0
G10 P0 X0 Y0 Z0                         ; Reset tool 0 axis offsets
M568 P0 R0 S0                            ; Reset initial tool 0 active and standby temperatures to 0C

M563 P1 S"T1 0.4 285" D1 H2 F4          ; Define tool 1
G10 P1 X0 Y0 Z0                         ; Reset tool 1 axis offsets
M568 P1 R0 S0                            ; Reset initial tool 1 active and standby temperatures to 0C

M563 P2 S"T2 0.4 175" D2 H3 F6          ; Define tool 2
G10 P2 X0 Y0 Z0                         ; Reset tool 2 axis offsets
M568 P2 R0 S0                            ; Reset initial tool 2 active and standby temperatures to 0C

M563 P3 S"T3 0.2 175" D3 H4 F8          ; Define tool 3
G10 P3 X0 Y0 Z0                         ; Reset tool 3 axis offsets
M568 P3 R0 S0                            ; Reset initial tool 3 active and standby temperatures to 0C

; Fans
; Fan0 output is not used
M950 F1 C"fan1"
M950 F2 C"fan2"
M950 F3 C"duex.fan3"
M950 F4 C"duex.fan4"
M950 F5 C"duex.fan5"
M950 F6 C"duex.fan6"
M950 F7 C"duex.fan7"
M950 F8 C"duex.fan8"

M106 P1 S255 H1 T70             ; T0 HE
M106 P2 S0                      ; T0 PCF
M106 P3 S255 H2 T70             ; T1 HE
M106 P4 S0                      ; T1 PCF 
M106 P5 S255 H3 T70             ; T2 HE 
M106 P6 S0                      ; T2 PCF
M106 P7 S255 H4 T70             ; T3 HE
M106 P8 S0                      ; T3 PCF

; Tools other settings
; ############

; Linear Advance
;M572 D0 S0.2                   ; pressure advance T0
;M572 D1 S0.2                   ; pressure advance T1
M572 D2 S0.04                   ; pressure advance T2 Hemera
M572 D3 S0.04                   ; pressure advance T3 Hemera

; Tool offsets G1 X318.1 Y0
global offsetK0K1Probes = 1.8 ;[mm] Z=0 after homing is 1.8mm lower than the nozzle probe trigger point. This is a static z offset for all tools.

G10 P0 X14.10 Y59.75 Z{global.offsetK0K1Probes-9.351}    ; T0 TitanAero 3mm
G10 P1 X13.54 Y59.42 Z{global.offsetK0K1Probes-9.688}    ; T1 TitanAero 3mm
G10 P2 X18.75 Y44.16 Z{global.offsetK0K1Probes-7.162}    ; T2 Hemera 1.75mm
G10 P3 X18.95 Y44.26 Z{global.offsetK0K1Probes-7.726}    ; T3 Hemera 1.75mm
