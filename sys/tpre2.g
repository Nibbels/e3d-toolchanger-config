; tpre2.g
; called before tool 2 is selected
; tool state.currentTool is -1

if move.axes[0].homed && move.axes[1].homed && move.axes[2].homed
  ;Unlock Coupler
  M98 P"/macros/Coupler - Unlock"

  ;Move to safe location
  G1 X212.2 Y200 F15000

  ;Collect
  G1 Y217.1 F2500
  M98 P"/macros/Coupler - Lock"

  G91
  G1 H2 Z10 F7000
  G90
