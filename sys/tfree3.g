; tfree3.g
; called when tool 3 is freed
; tool state.currentTool is 3

; Space Z
G1 Z{move.axes[2].userPosition + 10} F1000

;Purge nozzle
;M98 P"purge.g"

;Drop tool to dock
G53 G1 X304.5 Y144 F50000
G53 G1        Y187 F10000
G53 G1        Y213 Z{move.axes[2].userPosition - 10} F2500
M98 P"/macros/Coupler - Unlock"

;Move Out
G53 G1        Y144 F50000

;fan off
M106 P8 S0