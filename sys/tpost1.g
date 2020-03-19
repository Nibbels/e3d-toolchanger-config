; tpost1.g
; called after tool 1 has been selected
; tool state.currentTool 1

M703 ; load filament config

;heatup
M116 P1

; move tool off dock, lower Z because of tools extra height
G91
G1 Z10 F7000
G1 Y-70 F10000
G90

;PCF fan on
M106 P4 S127
