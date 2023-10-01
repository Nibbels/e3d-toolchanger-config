; This is the button for nozzle Z calibration
; Use only with tool attached
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed || state.currentTool < 0
  echo "Do not probe without a tool and homed XYZ!"
  M999

if heat.heaters[tools[state.currentTool].heaters[0]].current > 50.0
  echo "Do not melt the microswitch with a hot nozzle!"
  M999

G53 G1 Z15 F2500
G1 X321.800 Y179.350 F3500
