M221 S90               ; Flow(Diameter Compensation) 
                       ; Steps/mm for 285 is default
;M568 R180 S212         ; Set Nozzle Standby and Active Temperature
M207 S1.2 F2400 Z0.2   ; Hardware Retract length
M220 S100              ; Set speed factor override percentage

; https://docs.duet3d.com/User_manual/Reference/Gcodes#m572-set-or-report-extruder-pressure-advance
; https://docs.duet3d.com/User_manual/Reference/Gcodes#m592-configure-nonlinear-extrusion
; https://docs.duet3d.com/User_manual/Reference/Gcodes#m203-set-maximum-feedrate
