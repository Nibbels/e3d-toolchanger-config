; tpost3.g
; called after tool 3 has been selected
; tool state.currentTool 3

M703 ; load filament config

;heatup
M116 P3

; move tool off dock, lower Z because of tools extra height
G91
G1 Z10 F7000
G1 Y-70 F10000
G90

; restore print cooling fan speed
M106 R1

G1 R2 Z0
