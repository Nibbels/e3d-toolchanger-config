M221 S35               ; Flow(Diameter Compensation)  -> 88/3 flow corrects slicer 1.75 setting
                       ; Steps/mm for 285 is default
M568 R180 S212         ; Set Nozzle Standby and Active Temperature
M207 S1.3 F1800 Z0.2   ; Hardware Retract length
M220 S100              ; Set speed factor override percentage

; https://docs.duet3d.com/User_manual/Reference/Gcodes#m572-set-or-report-extruder-pressure-advance
; https://docs.duet3d.com/User_manual/Reference/Gcodes#m592-configure-nonlinear-extrusion
