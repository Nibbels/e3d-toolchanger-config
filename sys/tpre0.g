; tpre0.g
; called before tool 0 is selected

;Unlock Coupler
M98 P"/macros/Coupler - Unlock"

;Move to safe location
G1 X-15.1 Y144   F50000
G1        Y187   F10000

;Collect
G1        Y213.1 F2500
M98 P"/macros/Coupler - Lock"
