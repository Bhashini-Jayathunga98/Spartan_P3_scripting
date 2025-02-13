
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set AXI_group [add_wave_group AXI(axi_master) -into $cinoutgroup]
set rdata_group [add_wave_group "Read Channel" -into $AXI_group]
set wdata_group [add_wave_group "Write Channel" -into $AXI_group]
set ctrl_group [add_wave_group "Handshakes" -into $AXI_group]
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_BUSER -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_BID -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_BRESP -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_RRESP -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_RUSER -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_RID -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_RDATA -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_ARUSER -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_ARREGION -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_ARQOS -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_ARPROT -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_ARBURST -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_ARLEN -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_ARID -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_ARADDR -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_WUSER -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_WID -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_WSTRB -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_WDATA -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_AWUSER -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_AWREGION -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_AWQOS -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_AWPROT -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_AWBURST -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_AWLEN -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_AWID -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_AWADDR -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/m_axi_gmem_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set sta_group [add_wave_group sta(wire) -into $coutputgroup]
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/sta -into $sta_group -radix hex
set rdata_group [add_wave_group rdata(wire) -into $coutputgroup]
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/rdata -into $rdata_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(wire) -into $cinputgroup]
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/AXI -into $return_group -radix hex
set cmd_group [add_wave_group cmd(wire) -into $cinputgroup]
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/cmd -into $cmd_group -radix hex
set radd_group [add_wave_group radd(wire) -into $cinputgroup]
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/radd -into $radd_group -radix hex
set wadd_group [add_wave_group wadd(wire) -into $cinputgroup]
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/wadd -into $wadd_group -radix hex
set wdata_group [add_wave_group wdata(wire) -into $cinputgroup]
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/wdata -into $wdata_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/ap_start -into $blocksiggroup
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/ap_done -into $blocksiggroup
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/ap_idle -into $blocksiggroup
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_parallel_to_AXI_top/AESL_inst_parallel_to_AXI/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_parallel_to_AXI_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_parallel_to_AXI_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_parallel_to_AXI_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_parallel_to_AXI_top/LENGTH_gmem -into $tb_portdepth_group -radix hex
add_wave /apatb_parallel_to_AXI_top/LENGTH_wdata -into $tb_portdepth_group -radix hex
add_wave /apatb_parallel_to_AXI_top/LENGTH_wadd -into $tb_portdepth_group -radix hex
add_wave /apatb_parallel_to_AXI_top/LENGTH_rdata -into $tb_portdepth_group -radix hex
add_wave /apatb_parallel_to_AXI_top/LENGTH_radd -into $tb_portdepth_group -radix hex
add_wave /apatb_parallel_to_AXI_top/LENGTH_cmd -into $tb_portdepth_group -radix hex
add_wave /apatb_parallel_to_AXI_top/LENGTH_sta -into $tb_portdepth_group -radix hex
add_wave /apatb_parallel_to_AXI_top/LENGTH_AXI -into $tb_portdepth_group -radix hex
set tbcinoutgroup [add_wave_group "C InOuts" -into $testbenchgroup]
set tb_AXI_group [add_wave_group AXI(axi_master) -into $tbcinoutgroup]
set rdata_group [add_wave_group "Read Channel" -into $tb_AXI_group]
set wdata_group [add_wave_group "Write Channel" -into $tb_AXI_group]
set ctrl_group [add_wave_group "Handshakes" -into $tb_AXI_group]
add_wave /apatb_parallel_to_AXI_top/gmem_BUSER -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_BID -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_BRESP -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_RRESP -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_RUSER -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_RID -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_RDATA -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_ARUSER -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_ARREGION -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_ARQOS -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_ARPROT -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_ARBURST -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_ARLEN -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_ARID -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_ARADDR -into $rdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_WUSER -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_WID -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_WSTRB -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_WDATA -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_AWUSER -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_AWREGION -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_AWQOS -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_AWPROT -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_AWBURST -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_AWLEN -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_AWID -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_AWADDR -into $wdata_group -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_parallel_to_AXI_top/gmem_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_sta_group [add_wave_group sta(wire) -into $tbcoutputgroup]
add_wave /apatb_parallel_to_AXI_top/sta -into $tb_sta_group -radix hex
set tb_rdata_group [add_wave_group rdata(wire) -into $tbcoutputgroup]
add_wave /apatb_parallel_to_AXI_top/rdata -into $tb_rdata_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(wire) -into $tbcinputgroup]
add_wave /apatb_parallel_to_AXI_top/AXI -into $tb_return_group -radix hex
set tb_cmd_group [add_wave_group cmd(wire) -into $tbcinputgroup]
add_wave /apatb_parallel_to_AXI_top/cmd -into $tb_cmd_group -radix hex
set tb_radd_group [add_wave_group radd(wire) -into $tbcinputgroup]
add_wave /apatb_parallel_to_AXI_top/radd -into $tb_radd_group -radix hex
set tb_wadd_group [add_wave_group wadd(wire) -into $tbcinputgroup]
add_wave /apatb_parallel_to_AXI_top/wadd -into $tb_wadd_group -radix hex
set tb_wdata_group [add_wave_group wdata(wire) -into $tbcinputgroup]
add_wave /apatb_parallel_to_AXI_top/wdata -into $tb_wdata_group -radix hex
save_wave_config parallel_to_AXI.wcfg
run all
quit

