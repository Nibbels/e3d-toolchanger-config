M400			; Finish move queue
T-1

M144 P0 ; turn bed into standby

G10 P0 S-273.15 R-273.15
G10 P1 S-273.15 R-273.15
G10 P2 S-273.15 R-273.15
G10 P3 S-273.15 R-273.15

;M104 T0 S-273.15 ; turn off extruder
;M104 T1 S-273.15 ; turn off extruder
;M104 T2 S-273.15 ; turn off extruder
;M104 T3 S-273.15 ; turn off extruder

M18 ; disable motors
