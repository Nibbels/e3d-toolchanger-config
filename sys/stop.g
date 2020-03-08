; stop.g
; called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)
T-1

G91
G1 Z3 F500
G90

G28 Y
M18
