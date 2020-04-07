M221 S90               ; Flow(Diameter Compensation) 
                       ; Steps/mm for 285 is default
G10 R205 S230          ; Set Nozzle Standby and Active Temperature
M207 S1.0 F2400 R-0.1 T600 Z0.08   ; Hardware Retract length

; https://duet3d.dozuki.com/Wiki/Gcode#Section_M572_Set_or_report_extruder_pressure_advance
; https://duet3d.dozuki.com/Wiki/Gcode#Section_M592_Configure_nonlinear_extrusion