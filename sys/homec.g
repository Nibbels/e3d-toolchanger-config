; homec.g
; called to home the C axis (coupler)
;
; Needed configuration:
;  M574 C1 S3        ; Endstop config: C1 = low end, S3 = Single motor load detection for coupler
;  M350 C8 I0        ; Configure 8x microstepping, no interpolation
;  M208 C0:240 S0    ; Set axis minima and maxima.
;  M906 ... C400     ; Set coupler motor current to 400 [mA] (stock config)
;  M92  ... C100     ; Set coupler steps per mm to 100 [steps/mm]
;  M566 ... C2       ; Set coupler jerk to 2 (stock config)
;  M203 ... C5000    ; Set maximum speeds [mm/min] (stock config)
;  M201 ... C500     ; Set accelerations [mm/s^2] (stock config)
;  M915 C S3 F1 H400 ; Coupler Stall Detection
;
;  Comment on M915: I had a problem that sensitivity S3 always stopped and sensitivity S4 did detect nothing using F0.
;                   This worked using F1.
;
; Macro Coordinates: Lock position is C40, unlock position is C123

M400
G91                 ; Relative coordinates
M913 C80            ; Crash fallback: Set C motor to lower current, but < 60 was unstable low.
G1 H1 C10 F5000     ; Space min end or stall at max end, needed for acceleration towards near min end.
G1 H1 C-1000 F5000  ; Try to stall at min end, reset to min-axis M203 = 0 coordinate
M400
G92 C0              ; Crash fallback: coordinates reset to 0 in case stall did not reset to min-axis M203 coordinate
G90                 ; Back to absolute coordinates
M913 C100           ; Set C motor 100% current

;Open Coupler
M98 P"/macros/Coupler - Unlock"
