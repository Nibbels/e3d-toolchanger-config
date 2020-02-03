; tpost0.g
; called after tool 0 has been selected
M703 ; load filament config

;heatup
M116 P0

; move tool off dock, lower Z because of tools extra height
G91
G1 Y-70 Z10 F7000
G90

;prime nozzle
;M98 P"prime.g"

;PCF fan on
M106 P2 S127
