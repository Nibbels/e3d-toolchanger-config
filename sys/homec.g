; homec.g
; called to home the C axis (coupler)

G91
M400
M913 C70            ; MOTORS TO LOWER CURRENT
G1 H2 C-1000 F5000
G92 C-125
G90
M913 C100           ; MOTORS TO 100% CURRENT
G1 C0 F5000

;Open Coupler
M98 P"/macros/Coupler - Unlock"
