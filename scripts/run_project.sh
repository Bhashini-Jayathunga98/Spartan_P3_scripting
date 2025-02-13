#!/bin/bash

# Define paths
VIVADO_PATH="/tools/Xilinx/Vivado/2020.1/bin/vivado"
TCL_SCRIPT="/home/bhashini/Desktop/spartan_p3_new/scripting/scripts/non_project_mode_script.tcl"

# Run Vivado in batch mode
$VIVADO_PATH -mode batch -source "$TCL_SCRIPT"

# Check the exit status of the Vivado command
if [ $? -eq 0 ]; then
    echo "Vivado script executed successfully."
else
    echo "Vivado script execution failed. Check the log file for details: $LOG_FILE"
    exit 1
fi



