M400			; Finish move queue
T-1

M144 P0 ; turn bed into standby

M104 T0 S-273.15 ; turn off extruder
M104 T1 S-273.15 ; turn off extruder
M104 T2 S-273.15 ; turn off extruder
M104 T3 S-273.15 ; turn off extruder

M18 ; disable motors
