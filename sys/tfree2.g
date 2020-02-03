; tfree2.g
; called when tool 2 is freed

;Drop the bed
G91
G1 Z4 F1000
G90

;Purge nozzle
;M98 P"purge.g"

;Drop tool to dock
G53 G1 X214.5 Y144 F50000
G53 G1        Y187 F10000
G53 G1        Y213 F2500
M98 P"/macros/Coupler - Unlock"

;Move Out
G53 G1        Y144 F50000

;fan off
M106 P6 S0
