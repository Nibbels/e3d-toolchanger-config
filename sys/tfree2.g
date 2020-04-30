; tfree2.g
; called when tool 2 is freed
; tool state.currentTool is 2

if move.axes[0].homed && move.axes[1].homed && move.axes[2].homed
  ; Space Z
  G91
  G1 H2 Z5 F1000
  G90
  ;M561 ; This cancels any bed-plane fitting

  ;Purge nozzle
  ;M98 P"purge.g"

  ;Safety distance with tool attached
  G53 G1 X212.2 Y144 F15000

  ;Drop tool to dock
  G53 G1        Y200   F10000
  G53 G1        Y217.1 F2500
  M98 P"/macros/Coupler - Unlock"

  ;Move Out
  G53 G1        Y200 F15000

  ;fan off
  M106 P6 S0
