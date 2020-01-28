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
G53 G1 X-15.1 Y140 F50000
G53 G1 X-15.1 Y180 F10000
G53 G1 X-15.1 Y200 F3000
G53 G1 X-15.1 Y213.1 F1000

;Open Coupler
M98 P"/macros/Coupler - Unlock"

;fan off
M106 P2 S0

;Move Out
G53 G1 X-15.1 Y140 F50000
