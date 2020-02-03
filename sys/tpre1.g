; tpre1.g
; called before tool 1 is selected
; tool state.currentTool is -1

;Unlock Coupler
M98 P"/macros/Coupler - Unlock"

;Move to safe location
G1 X75.3 Y144   F50000
G1       Y187   F10000

;Collect
G1       Y213.3 F2500
M98 P"/macros/Coupler - Lock"
