; tfree0.g
; called when tool 0 is freed

;Drop the bed
G91
G1 Z4 F1000
G90

;Purge nozzle
;M98 P"purge.g"

;Drop tool to dock
G53 G1 X-15.1 Y144   F50000
G53 G1        Y187   F10000
G53 G1        Y213.1 F2500
M98 P"/macros/Coupler - Unlock"

;Move Out
G53 G1        Y144   F50000

;fan off
M106 P2 S0
