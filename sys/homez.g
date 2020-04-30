; homez.g
; called to home the Z axis

M98 P"/macros/Coupler - Unlock" ; Open Coupler

G91                 ; Relative mode
G1 H2 Z5 F5000      ; Lower the bed
G90                 ; back to absolute positioning

G1 X292 Y184 F15000 ; Position the endstop above the bed centre

M558 F300
G30

