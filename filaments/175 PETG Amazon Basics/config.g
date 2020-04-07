M221 S88               ; Flow(Diameter Compensation) 
                       ; Steps/mm for 175 is default
G10 R205 S230          ; Set Nozzle Standby and Active Temperature
M207 S0.8 F2400 Z0.2   ; Hardware Retract length

; https://duet3d.dozuki.com/Wiki/Gcode#Section_M572_Set_or_report_extruder_pressure_advance
; https://duet3d.dozuki.com/Wiki/Gcode#Section_M592_Configure_nonlinear_extrusion