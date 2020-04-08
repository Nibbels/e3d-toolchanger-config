M290 R0 Z0
;M561 ; This cancels any bed-plane fitting


; select the extruders with no homing to preheat all at once.
M18
T0
M703
T1
M703
T2
M703

T-1


G28 ; home all axes
;G29 ; scan surface

; Heat up T0 and T1, prime them and put the tools back.
T0
M98 P"prime.g"

T1
M98 P"prime.g"

T2
M98 P"prime.g"

T-1

M290 R1 Z0.0