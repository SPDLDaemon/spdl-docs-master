EESchema Schematic File Version 4
LIBS:magSenseSimA-cache
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
L pspice:VSOURCE PULSE
U 1 1 5E2AA4FC
P 6950 3000
F 0 "PULSE" H 7178 3046 50  0000 L CNN
F 1 "300uV" H 7178 2955 50  0000 L CNN
F 2 "" H 6950 3000 50  0001 C CNN
F 3 "" H 6950 3000 50  0001 C CNN
F 4 "V" H 6950 3000 50  0001 C CNN "Spice_Primitive"
F 5 "dc 0 pulse(0 300u 0 1n 1n 10u 20u)" H 6950 3000 50  0001 C CNN "Spice_Model"
F 6 "Y" H 6950 3000 50  0001 C CNN "Spice_Netlist_Enabled"
	1    6950 3000
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND?
U 1 1 5E2AA605
P 6950 3500
F 0 "#GND?" H 6950 3400 50  0001 C CNN
F 1 "0" H 6950 3587 50  0000 C CNN
F 2 "" H 6950 3500 50  0001 C CNN
F 3 "" H 6950 3500 50  0001 C CNN
	1    6950 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 3500 6950 3350
$Comp
L pspice:VSOURCE SINE
U 1 1 5E2AA72A
P 7450 2500
F 0 "SINE" V 6947 2500 50  0000 C CNN
F 1 "5mV" V 7038 2500 50  0000 C CNN
F 2 "" H 7450 2500 50  0001 C CNN
F 3 "" H 7450 2500 50  0001 C CNN
F 4 "V" H 7450 2500 50  0001 C CNN "Spice_Primitive"
F 5 "dc 0 ac 2.5m sin(0 2.5m 20k)" H 7450 2500 50  0001 C CNN "Spice_Model"
F 6 "Y" H 7450 2500 50  0001 C CNN "Spice_Netlist_Enabled"
	1    7450 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	6950 2700 6950 2500
Wire Wire Line
	6950 2500 7150 2500
$Comp
L pspice:INDUCTOR L
U 1 1 5E2AA933
P 8250 2500
F 0 "L" H 8250 2715 50  0000 C CNN
F 1 "8.2mH" H 8250 2624 50  0000 C CNN
F 2 "" H 8250 2500 50  0001 C CNN
F 3 "" H 8250 2500 50  0001 C CNN
	1    8250 2500
	1    0    0    -1  
$EndComp
$Comp
L pspice:R R
U 1 1 5E2AA9DC
P 8950 2500
F 0 "R" V 8745 2500 50  0000 C CNN
F 1 "24" V 8836 2500 50  0000 C CNN
F 2 "" H 8950 2500 50  0001 C CNN
F 3 "" H 8950 2500 50  0001 C CNN
	1    8950 2500
	0    1    1    0   
$EndComp
$Comp
L pspice:C C
U 1 1 5E2AABD4
P 8600 2950
F 0 "C" V 8285 2950 50  0000 C CNN
F 1 "20pF" V 8376 2950 50  0000 C CNN
F 2 "" H 8600 2950 50  0001 C CNN
F 3 "" H 8600 2950 50  0001 C CNN
	1    8600 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	7750 2500 8000 2500
Wire Wire Line
	8500 2500 8700 2500
Wire Wire Line
	9200 2500 9300 2500
Wire Wire Line
	9300 2500 9300 2950
Wire Wire Line
	9300 2950 8850 2950
Wire Wire Line
	6950 3350 7950 3350
Wire Wire Line
	7950 3350 7950 2950
Wire Wire Line
	7950 2950 8350 2950
Connection ~ 6950 3350
Wire Wire Line
	6950 3350 6950 3300
Text Label 9300 2500 0    50   ~ 0
A
$EndSCHEMATC
