; tfree1.g
; called when tool 1 is freed
; tool state.currentTool is 1

; Space Z
G91
G1 H2 Z5 F1000
G90
;M561 ; This cancels any bed-plane fitting

;Purge nozzle
;M98 P"purge.g"

;Safety distance with tool attached
G53 G1 X75.3 Y144   F15000

;Drop tool to dock
G53 G1       Y200   F10000
G53 G1       Y213.3 F2500
M98 P"/macros/Coupler - Unlock"

;Move Out
G53 G1       Y200   F15000

;fan off
M106 P4 S0
