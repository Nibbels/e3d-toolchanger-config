; tpre3.g
; called before tool 3 is selected
; tool state.currentTool is -1

;Unlock Coupler
M98 P"/macros/Coupler - Unlock"

;Move to safe location
G1 X304.5 Y200 F15000

;Collect
G1        Y213 F2500
M98 P"/macros/Coupler - Lock"
