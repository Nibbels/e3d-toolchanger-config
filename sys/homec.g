; homec.g
; called to home the C axis (coupler)

G91
M400
M913 C60		; XY MOTORS TO 60% CURRENT
G1 H2 C-500 F20000
G92 C-125
G90
M913 C100			; XY MOTORS TO 100% CURRENT
G1 C0 F10000

;Open Coupler
M98 P"/macros/Coupler - Unlock"
