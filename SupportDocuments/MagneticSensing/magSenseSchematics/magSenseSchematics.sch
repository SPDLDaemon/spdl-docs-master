EESchema Schematic File Version 4
LIBS:magSenseSchematics-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:L L?
U 1 1 5E2AB0F7
P 4800 3000
F 0 "L?" V 4990 3000 50  0001 C CNN
F 1 "Coil Inductance" V 4898 3000 50  0000 C CNN
F 2 "" H 4800 3000 50  0001 C CNN
F 3 "~" H 4800 3000 50  0001 C CNN
	1    4800 3000
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5E2AB0FD
P 4800 3200
F 0 "C?" V 4548 3200 50  0001 C CNN
F 1 "Coil Capacitance" V 4950 3200 50  0000 C CNN
F 2 "" H 4838 3050 50  0001 C CNN
F 3 "~" H 4800 3200 50  0001 C CNN
	1    4800 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 3000 4950 3100
Wire Wire Line
	4650 3000 4650 3100
Wire Wire Line
	4250 3100 4650 3100
Connection ~ 4650 3100
Wire Wire Line
	4650 3100 4650 3200
Wire Wire Line
	4950 3100 5350 3100
Connection ~ 4950 3100
Wire Wire Line
	4950 3100 4950 3200
Wire Notes Line
	4400 2800 4400 3450
Wire Notes Line
	4400 3450 5200 3450
Wire Notes Line
	5200 3450 5200 2800
Wire Notes Line
	5200 2800 4400 2800
Text Notes 4400 2800 0    50   ~ 0
Inductor Model
$EndSCHEMATC
