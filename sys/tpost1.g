; tpost1.g
; called after tool 1 has been selected
; tool state.currentTool 1

if move.axes[0].homed && move.axes[1].homed && move.axes[2].homed
  M703 ; load filament config

  ;heatup
  M116 P1

  ; move tool off dock, lower Z because of tools extra height
  G91
  G1 Y-70 F20000
  G90

  ; restore print cooling fan speed
  ; Rnnn Restore fan speed to the value it has when the print was paused (R1) or the last time the fan speed was set and no P parameter was provided (R2).
  M106 R2

  ;G29 S1 ; Use the Z offset Mesh Map on the SD card
  G1 R2 Z10 F30000;
