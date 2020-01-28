; tpre1.g
; called before tool 1 is selected

;Ensure no tool is selected
;T-1

;Unlock Coupler
M98 P"/macros/Coupler - Unlock"

;Move to location
G1 X75.3 Y180 F50000

;Move in
G1 X75.3 Y200 F5000

;Collect
G1 X75.3 Y213.3 F2500

;Close Coupler
M98 P"/macros/Coupler - Lock"

;WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;if you are using non-standard length hotends ensure the bed is lowered enough BEFORE undocking the tool!
G91
G1 Z15 F1000
G90

;Move Out
G1 X75.3 Y140 F4000