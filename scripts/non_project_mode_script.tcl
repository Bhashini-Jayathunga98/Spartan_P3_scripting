# Set project directory paths

set dir "/home/bhashini/Desktop/spartan_p3_new/scripting"

set src_dir "$dir/src/rtl"
set xdc_file "$dir/constraints/sp7_cal3.xdc"
set ip_repo "$dir/src/ip"
set ip_repo_custom "$dir/src/custom_ip"
set outputDir "$dir/output"

# Set the part number
set_part {xc7s25csga324-2}


# Create a clean workspace
if {![file exists $outputDir]} {
    file mkdir $outputDir
}

# Add source files
puts "Adding Source files.................................................................................."
set error_count_1 0

foreach vhdl_file [list \
    "async_reg/async_reg.vhd" \
    "clock_counter/clock_counter.vhd" \
    "ClockPowerGood/ClockPowerGood.vhd" \
    "ext_clock_detector/ext_clk_detector_ctrl.vhd" \
    "GlobalPowerGood/GlobalPowerGood.vhd" \
    "iobuf/io_buf.vhd" \
    "iobuf/obuft.vhd" \
    "LDO_ENABLE/ldo_enable.vhd" \
    "MCU_PLL_SPI/MCU_PLL_SPI.vhd" \
    "PG_fault/PG_fault.vhd" \
    "PLL_lock_stat/PLL_lock_stat.vhd" \
    "PLL_reset/PLL_reset.vhd" \
    "PLLSync/PLLSync.vhd" \
    "pwm/pwm.vhd" \
    "pwm/SignalDelay.vhd" \
    "SP7_KU_PG/SP7_KU_PG.vhd" \
    "SP7_LS_PG/SP7_LS_PG.vhd" \
    "SP7_LS_RESET/SP7_LS_reset.vhd" \
    "SP7_ZU_PG/SP7_ZU_PG.vhd" \
    "SP_AFE_PG/SP7_AFE_PG.vhd" \
    "spi_regbank/spi_regbank.vhd" \
    "spi_regbank/spi_slave.vhd" \
    "utility_dff/latch_data.vhd" \
    "utility_dff/utility_dff.vhd" \
    "DMCU_SPI_OBUFT.vhd" \
    "hier_0_vio.vhd" \
    "hier_50MHz_out.vhd" \
    "hier_BOARD_POWER_DONE.vhd" \
    "hier_clken.vhd" \
    "hier_clken_obuft.vhd"\
    "hier_CLK_PG.vhd"\
    "hier_clock_measurments.vhd"\
    "hier_delayer.vhd"\
    "hier_GNSS_en.vhd"\
    "hier_ldo.vhd"\
    "hier_LS_Kintex_sel.vhd"\
    "hier_LS_OBUFT.vhd"\
    "hier_LS_QSPI_sel.vhd"\
    "hier_LS_reset.vhd"\
    "hier_LS_SPI.vhd"\
    "hier_LS_SPI_MISO_IOBUF.vhd"\
    "hier_LS_Zynq_sel.vhd"\
    "hier_MCU_SPI.vhd"\
    "hier_pll.vhd"\
    "hier_pll_spi_obuft.vhd"\
    "hier_pwm.vhd"\
    "hier_SPI_regbank.vhd"\
    "hier_sync.vhd"\
    "hier_synchronizers_ldo.vhd"\
    "hier_synchronizers_ZU_status.vhd"\
    "hier_sync_ldo.vhd"\
    "hier_ZU_status.vhd"\
    "hier_Zynq_mode_pin.vhd"\
    "LS_SPI_OBUFT.vhd"\
    "pll_obut.vhd"\
    "sp7_cal3.vhd"\
    "sp7_cal3_wrapper.vhd"\
] {
    # Error handling for each file
    if {[catch {read_vhdl "$src_dir/$vhdl_file"} result]} {
        puts "Error reading file $vhdl_file: $result"
        incr error_count_1
    } else {
        puts "Successfully added file: $vhdl_file"
    }
}
if {$error_count_1 > 0} {
    puts "Finished adding source files with $error_count_1 errors."
    exit 1
} else {
    puts "All source files added successfully."
}


# Add constraints
put "Adding constraints.................................................................................."
if {[catch {read_xdc $xdc_file} result]} {
    puts "Error reading constraints file ($xdc_file): $result"
    exit 1
} else {
    puts "Successfully added constraints file: $xdc_file"
}


# Add IP repository
puts "Adding IP repository and updating IP catalog.................................................................................."

# Set IP repository paths
if {[catch {set_property ip_repo_paths $ip_repo [get_filesets sources_1]} result]} {
    puts "Error setting IP repository paths: $result"
    exit 1
} else {
    puts "Successfully set IP repository paths: $ip_repo"
}

# Update IP catalog
if {[catch {update_ip_catalog} result]} {
    puts "Error updating IP catalog: $result"
    exit 1
} else {
    puts "Successfully updated IP catalog."
}

puts "Processing IPs.................................................................................."

# Define IPs to process
set ip_list [list \
    "sp7_cal3_clk_wiz_10_OCXO_0"\
    "sp7_cal3_ila_0_0"\
    "sp7_cal3_mmcm_50Mhz_0"\
    "sp7_cal3_proc_sys_reset_0_0"\
    "sp7_cal3_proc_sys_reset_0_1"\
    "sp7_cal3_proc_sys_reset_1_0"\
    "sp7_cal3_util_ds_buf_0_0"\
    "sp7_cal3_util_ds_buf_0_1"\
    "sp7_cal3_util_ds_buf_0_2"\
    "sp7_cal3_util_gnss_clk_buf_0_0"\
    "sp7_cal3_vio_0_0"\
    "sp7_cal3_vio_clk_pwr_enable_0"\
    "sp7_cal3_vio_clock_measures_0"\
    "sp7_cal3_vio_main_config_0"\
    "sp7_cal3_vio_PLL_config_0"\
    "sp7_cal3_vio_ZU_status_0"\
]

# Initialize error counter
set error_count_2 0

# Process each IP
foreach ip_name $ip_list {
    set ip_xci "$ip_repo/$ip_name/$ip_name.xci"


    # Read IP
    if {[catch {read_ip $ip_xci} result]} {
        puts "Error reading IP ($ip_name): $result"
        incr error_count_2
        continue
    } else {
        puts "Successfully read IP: $ip_name"
    }

    # Generate target for IP
    if {[catch {generate_target all [get_files $ip_xci]} result]} {
        puts "Error generating target for IP ($ip_name): $result"
        incr error_count_2
        continue
    } else {
        puts "Successfully generated target for IP: $ip_name"
    }

    set_property GENERATE_SYNTH_CHECKPOINT TRUE [get_files $ip_xci]

    # Synthesize IP
    if {[catch {synth_ip [get_files $ip_xci] -force} result]} {
        puts "Error synthesizing IP ($ip_name): $result"
        incr error_count_2
    } else {
        puts "Successfully synthesized IP: $ip_name"
    }
}

# Final summary
if {$error_count_2 > 0} {
    puts "Finished processing IPs with $error_count_2 errors."
    exit 1
} else {
    puts "All IPs processed successfully."
}



puts "Adding Custom IP Repository and Processing Custom IP..........................................................................."

set custom_ip_list [list \
    "axil_dac82002_1.1" \
    "axi_time_ctrl_v1_00_a_1.0" \
    "axi_uart16550_v1_02_a_1.0"  \
    "hier_flash_microblaze"\
]

foreach custom_ip_name $custom_ip_list {
    set custom_ip_repo "$ip_repo_custom/$custom_ip_name"

    # Add custom IP repository
    if {[catch {set_property ip_repo_paths $custom_ip_repo [get_filesets sources_1]} result]} {
        puts "Error setting custom IP repository paths: $result"
        exit 1
    } else {
        puts "Successfully set custom IP repository paths: $custom_ip_repo"
    }

    # Update IP catalog
    if {[catch {update_ip_catalog} result]} {
        puts "Error updating IP catalog: $result"
        exit 1
    } else {
        puts "Successfully updated IP catalog."
    }
}

set ip_hls "$dir/hls/parallel_to_AXI/solution1"

# Add hls IP repository
if {[catch {set_property ip_repo_paths $ip_hls [get_filesets sources_1]} result]} {
    puts "Error setting custom IP repository paths: $result"
    exit 1
} else {
    puts "Successfully set custom IP repository paths: $ip_hls"
}

# Update IP catalog
if {[catch {update_ip_catalog} result]} {
    puts "Error updating IP catalog: $result"
    exit 1
} else {
    puts "Successfully updated IP catalog."
}

# Define custom IP
set ip_xci_custom "$ip_repo/sp7_cal3_hier_flash_microblaze_0_1/sp7_cal3_hier_flash_microblaze_0_1.xci"

# Read custom IP
if {[catch {read_ip $ip_xci_custom} result]} {
    puts "Error reading custom IP ($ip_xci_custom): $result"
    exit 1
} else {
    puts "Successfully read custom IP: $ip_xci_custom"
}

# Generate target for custom IP
if {[catch {generate_target all [get_files $ip_xci_custom]} result]} {
    puts "Error generating target for custom IP ($ip_xci_custom): $result"
    exit 1
} else {
    puts "Successfully generated target for custom IP: $ip_xci_custom"
}

#set_property GENERATE_SYNTH_CHECKPOINT TRUE [get_files $ip_xci_custom]

# Synthesize custom IP
if {[catch {synth_ip [get_files $ip_xci_custom] -force} result]} {
    puts "Error synthesizing custom IP ($ip_xci_custom): $result"
    #exit 1
} else {
    puts "Successfully synthesized custom IP: $ip_xci_custom"
}


# Elaborate the design
synth_design -top sp7_cal3_wrapper -part xc7s25csga324-2
write_checkpoint -force $outputDir/post_synth
report_timing_summary -file $outputDir/post_synth_timing_summary.rpt
report_power -file $outputDir/post_synth_power.rpt
report_io -file $outputDir/io_report.rpt
report_utilization -file $outputDir/post_synth_util.rpt

# Run implementation
opt_design
place_design
phys_opt_design
write_checkpoint -force $outputDir/post_place
report_timing_summary -file $outputDir/post_place_timing_summary.rpt


route_design
write_checkpoint -force $outputDir/post_route
report_timing_summary -file $outputDir/post_route_timing_summary.rpt
report_timing -sort_by group -max_paths 100 -path_type summary -file $outputDir/post_route_timing.rpt
report_clock_utilization -file $outputDir/clock_util.rpt
report_utilization -file $outputDir/post_route_util.rpt
report_power -file $outputDir/post_route_power.rpt
report_drc -file $outputDir/post_imp_drc.rpt

# Generate the bitstream
write_bitstream -force $outputDir/sp7_cal3_wrapper.bit

# Generate the debug probes file
write_debug_probes -force $outputDir/sp7_cal3_wrapper.ltx

# Generate .bin file from .bit file
write_cfgmem -format bin -interface spix4 -size 8 -loadbit "up 0 $outputDir/sp7_cal3_wrapper.bit" -file $outputDir/sp7_cal3_wrapper.bin -force
