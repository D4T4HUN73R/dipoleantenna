#!/bin/bash
# This script calculates the total length and leg length of a dipole antenna based on input frequency in kHz

read -p "Enter the frequency in KHz: " frequency

# Convert frequency to MHz
frequency=$(echo "scale=2; $frequency/1000" | bc)

# Calculate wavelength, half wavelength, and quarter wavelength in centimeters
speed_of_light=299792458 #m/s
wavelength=$(echo "scale=2; $speed_of_light/$frequency/10000" | bc)
half_wavelength=$(echo "scale=2; $wavelength/2" | bc)
quarter_wavelength=$(echo "scale=2; $wavelength/4" | bc)

# Calculate antenna length in feet
antenna_length=$(echo "scale=2; 468/$frequency" | bc)

# Calculate arm length in feet
arm_length=$(echo "scale=2; $antenna_length/2" | bc)

# Convert lengths from feet to centimeters
antenna_length_cm=$(echo "scale=3; $antenna_length*30.48" | bc)
arm_length_cm=$(echo "scale=3; $arm_length*30.48" | bc)

echo ""
echo "Total dipole length (L): $antenna_length_cm cm | Leg length (l): $arm_length_cm cm"
echo ""
echo "Wavelength: $wavelength cm | ½ $half_wavelength cm | ¼ $quarter_wavelength cm"
