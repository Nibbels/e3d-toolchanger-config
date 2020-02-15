; Resume macro file

; TODO do a prime/wipe cycle here to get rid of any filament that has oozed out

G1 R1 X0 Y0 Z3 F15000 ; go to 3mm above position of the last print move
G1 R1 X0 Y0 Z0 F3000  ; go back to the last print move
