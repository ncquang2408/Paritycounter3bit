## Timing constraints for 500 MHz (2ns period)

# Create a clock signal with a 2ns period (500 MHz frequency)
create_clock [get_ports CLK] -period 2 -waveform {0 1}

# Set clock uncertainty to 0.3ns
set_clock_uncertainty 0.3 [get_clocks CLK]

# Set clock transition time for rise and fall edges to 0.05ns
set_clock_transition -rise 0.05 [get_clocks CLK]
set_clock_transition -fall 0.05 [get_clocks CLK]

# Set input delay for signals RESET, EVEN, ODD, and PAUSE
set_input_delay -clock CLK 1.2 [get_ports RESET]
set_input_delay -clock CLK 1.2 [get_ports EVEN]
set_input_delay -clock CLK 1.2 [get_ports ODD]
set_input_delay -clock CLK 1.2 [get_ports PAUSE]

# Set output delay for each bit of the Q bus
set_output_delay -clock CLK 1.2 [get_ports {Q[2]}]
set_output_delay -clock CLK 1.2 [get_ports {Q[1]}]
set_output_delay -clock CLK 1.2 [get_ports {Q[0]}]

# Set output delay for each bit of the LED_7SEG bus
set_output_delay -clock CLK 1.2 [get_ports {LED_7SEG[6]}]
set_output_delay -clock CLK 1.2 [get_ports {LED_7SEG[5]}]
set_output_delay -clock CLK 1.2 [get_ports {LED_7SEG[4]}]
set_output_delay -clock CLK 1.2 [get_ports {LED_7SEG[3]}]
set_output_delay -clock CLK 1.2 [get_ports {LED_7SEG[2]}]
set_output_delay -clock CLK 1.2 [get_ports {LED_7SEG[1]}]
set_output_delay -clock CLK 1.2 [get_ports {LED_7SEG[0]}]

# Specify the driving cell for the CLK signal
set_driving_cell -lib_cell SAEDRVT14_BUF_10 -pin X [get_ports CLK]

# Specify the driving cell for control signals RESET, EVEN, ODD, and PAUSE
set_driving_cell -lib_cell SAEDRVT14_FDPRBQ_V2_0P5 -pin Q [get_ports RESET]
set_driving_cell -lib_cell SAEDRVT14_FDPRBQ_V2_0P5 -pin Q [get_ports EVEN]
set_driving_cell -lib_cell SAEDRVT14_FDPRBQ_V2_0P5 -pin Q [get_ports ODD]
set_driving_cell -lib_cell SAEDRVT14_FDPRBQ_V2_0P5 -pin Q [get_ports PAUSE]

# Set pin load for each bit of the Q bus
set_load -pin_load 0.004 [get_ports {Q[2]}]
set_load -pin_load 0.004 [get_ports {Q[1]}]
set_load -pin_load 0.004 [get_ports {Q[0]}]

# Set load for each bit of the LED_7SEG bus
set_load -pin_load 0.004 [get_ports {LED_7SEG[6]}]
set_load -pin_load 0.004 [get_ports {LED_7SEG[5]}]
set_load -pin_load 0.004 [get_ports {LED_7SEG[4]}]
set_load -pin_load 0.004 [get_ports {LED_7SEG[3]}]
set_load -pin_load 0.004 [get_ports {LED_7SEG[2]}]
set_load -pin_load 0.004 [get_ports {LED_7SEG[1]}]
set_load -pin_load 0.004 [get_ports {LED_7SEG[0]}]
