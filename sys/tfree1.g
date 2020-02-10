; tfree1.g
; called when tool 1 is freed
; tool state.currentTool is 1

; Space Z
G1 Z{move.axes[2].userPosition + 10} F1000

;Purge nozzle
;M98 P"purge.g"

;Drop tool to dock
G53 G1 X75.3 Y144   F50000
G53 G1       Y187   F10000
G53 G1       Y213.3 Z{move.axes[2].userPosition - 10} F2500
M98 P"/macros/Coupler - Unlock"

;Move Out
G53 G1       Y144   F50000

;fan off
M106 P4 S0
