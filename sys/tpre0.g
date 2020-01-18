; tpre0.g
; called before tool 0 is selected

;Ensure no tool is selected
;T-1

;Unlock Coupler
M98 P"/macros/Coupler - Unlock"

;Move to location
G1 X-17.5 Y200 F50000

;Move in
G1 X-17.5 Y215 F50000

;Collect
G1 X-17.5 Y224.1 F2500

;Close Coupler
M98 P"/macros/Coupler - Lock"

;WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;if you are using non-standard length hotends ensure the bed is lowered enough BEFORE undocking the tool!
G91
G1 Z15 F1000
G90

;Move Out
G1 X-17.5 Y150 F4000
