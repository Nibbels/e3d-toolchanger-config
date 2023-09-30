; File "0:/gcodes/3904_T0-PET_T1-PET_T2-PET_T3-PET_12h19m54s.gcode" resume print after print paused at 2022-11-26 22:41
G21
M140 P0 S95.0
G29 S1
G92 X226.402 Y190.727 Z-7.690 C40.000
G60 S1
G10 P0 S205 R176
G10 P2 S205 R208
G10 P3 S220 R200
G10 P1 S215 R208
T1 P0
M98 P"resurrect-prologue.g"
M116
M290 X0.000 Y0.000 Z-0.000 C0.000 R0
T-1 P0
T1 P6
; Workplace coordinates
G10 L2 P1 X0.00 Y0.00 Z0.00 C0.00
G10 L2 P2 X0.00 Y0.00 Z0.00 C0.00
G10 L2 P3 X0.00 Y0.00 Z0.00 C0.00
G10 L2 P4 X0.00 Y0.00 Z0.00 C0.00
G10 L2 P5 X0.00 Y0.00 Z0.00 C0.00
G10 L2 P6 X0.00 Y0.00 Z0.00 C0.00
G10 L2 P7 X0.00 Y0.00 Z0.00 C0.00
G10 L2 P8 X0.00 Y0.00 Z0.00 C0.00
G10 L2 P9 X0.00 Y0.00 Z0.00 C0.00
G54
M106 S0.00
M106 P2 S0.00
M106 P4 S0.00
M106 P6 S0.00
M106 P8 S0.00
M116
G92 E0.00000
M83
M486 S0 A"Wickeltisch Haken - 10mm.stl id:9 copy 0"
M486 S1 A"Wickeltisch Haken - 10mm.stl id:10 copy 0"
M486 S2 A"Wickeltisch Haken - 10mm.stl id:8 copy 0"
M486 S3 A"Wickeltisch Haken - 10mm.stl id:11 copy 0"
M486 S4 A"Wickeltisch Haken - 10mm.stl id:7 copy 0"
M486 S5 A"Wickeltisch Haken - 10mm.stl id:4 copy 0"
M486 S6 A"Wickeltisch Haken - 10mm.stl id:6 copy 0"
M486 S7 A"Wickeltisch Haken - 10mm.stl id:5 copy 0"
M486 S8 A"Wickeltisch Haken - 10mm.stl id:1 copy 0"
M486 S9 A"Wickeltisch Haken - 10mm.stl id:2 copy 0"
M486 S10 A"Wickeltisch Haken - 10mm.stl id:0 copy 0"
M486 S11 A"Wickeltisch Haken - 10mm.stl id:3 copy 0"
M486 S11
G17
M23 "0:/gcodes/3904_T0-PET_T1-PET_T2-PET_T3-PET_12h19m54s.gcode"
M26 S523006
G0 F6000 Z2.150
G0 F6000 X212.862 Y131.307 C40.000
G0 F6000 Z0.150
G1 F1800.0 P0
G21
M24
