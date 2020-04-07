; tpre0.g
; called before tool 0 is selected
; tool state.currentTool is -1

;Unlock Coupler
M98 P"/macros/Coupler - Unlock"

;Move to safe location
G1 X-15.1 Y200 F15000

;Collect
G1 Y213.1 F2500
M98 P"/macros/Coupler - Lock"

G91
G1 H2 Z10 F7000
G90