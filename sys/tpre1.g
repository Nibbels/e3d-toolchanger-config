; tpre1.g
; called before tool 1 is selected
; tool state.currentTool is -1

;Unlock Coupler
M98 P"/macros/Coupler - Unlock"

;Move to safe location
G1 X75.3 Y200   F15000

;Collect
G1       Y213.3 F2500
M98 P"/macros/Coupler - Lock"
