; Height over homed Z0 without tool offset:
var zOffsetTool = -move.axes[2].machinePosition
; Z distance from probe 0 toolhead trigger point on the print bed to probe 1 nozzle trigger point
var zOffsetStatic = move.axes[2].userPosition

echo "T", state.currentTool, "-move.axes[2]machinePosition -> zOffset for config.g:", var.zOffsetTool
echo "T", state.currentTool, "move.axes[2]userPosition -> Should be the same for all tools:", var.zOffsetStatic

G53 G1 Z15 F2500
   
; Auto adjust the z offset of the current tool
; To save this value write machinePosition into config.g G10 Pn commands.
G10 P{state.currentTool} Z{global.offsetK0K1Probes + var.zOffsetTool} 

; Explained in detail:
; 1) machinePosition is the trigger height relative to homed Z=0 without any tool offset.
; 2) machinePosition is positive, because physically the nozzle needs spacing from the tool head probe button. (Otherwise the tool head switch would be destroyed while printing.) The positive machinePosition should be set as negative zOffset for each tool.
; 3) userPosition is supposed to be the difference between the nozzle probe trigger point and the homed Z=0 without tool offsets.
;    -> That is the difference of both probes.
;    -> In my case the nozzle button is ~1.8mm higher than the probe point on the print bed.
;    -> userPosition should be equal for all tools in the logs after this script was executed.
;    -> userPosition in terms of "z difference of both probes" should be set as variable "global.offsetK0K1Probes" in config.g
