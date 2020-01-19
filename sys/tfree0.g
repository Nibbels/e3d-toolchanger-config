; tfree0.g
; called when tool 0 is freed

;Drop the bed
G91
G1 Z4 F1000
G90

;mesh levelling off
G29 S2

;Purge nozzle
;M98 P"purge.g"

;Move In
G53 G1 X-15.8 Y150 F50000
G53 G1 X-15.8 Y200 F50000
G53 G1 X-15.8 Y215 F50000
G53 G1 X-15.8 Y224.1 F5000

;Open Coupler
M98 P"/macros/Coupler - Unlock"

;fan off
M106 P2 S0

;Move Out
G53 G1 X-15.8 Y150 F50000
