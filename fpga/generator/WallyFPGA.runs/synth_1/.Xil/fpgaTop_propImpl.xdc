set_property SRC_FILE_INFO {cfile:/home/sidharth/Wally/cvw/fpga/constraints/constraints-ArtyA7.xdc rfile:../../../../constraints/constraints-ArtyA7.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN E3 [get_ports default_100mhz_clk]
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC F15 IOSTANDARD LVCMOS33} [get_ports phy_rx_clk]
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC D18 IOSTANDARD LVCMOS33} [get_ports {phy_rxd[0]}]
set_property src_info {type:XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC E17 IOSTANDARD LVCMOS33} [get_ports {phy_rxd[1]}]
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC E18 IOSTANDARD LVCMOS33} [get_ports {phy_rxd[2]}]
set_property src_info {type:XDC file:1 line:19 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC G17 IOSTANDARD LVCMOS33} [get_ports {phy_rxd[3]}]
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC G16 IOSTANDARD LVCMOS33} [get_ports phy_rx_dv]
set_property src_info {type:XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC C17 IOSTANDARD LVCMOS33} [get_ports phy_rx_er]
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC H16 IOSTANDARD LVCMOS33} [get_ports phy_tx_clk]
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC H14 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {phy_txd[0]}]
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC J14 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {phy_txd[1]}]
set_property src_info {type:XDC file:1 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC J13 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {phy_txd[2]}]
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC H17 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {phy_txd[3]}]
set_property src_info {type:XDC file:1 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC H15 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports phy_tx_en]
set_property src_info {type:XDC file:1 line:28 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC D17 IOSTANDARD LVCMOS33} [get_ports phy_col]
set_property src_info {type:XDC file:1 line:29 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC G14 IOSTANDARD LVCMOS33} [get_ports phy_crs]
set_property src_info {type:XDC file:1 line:30 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC G18 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports phy_ref_clk]
set_property src_info {type:XDC file:1 line:31 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {LOC C16 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports phy_reset_n]
set_property src_info {type:XDC file:1 line:40 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN A8 [get_ports {GPI[0]}]
set_property src_info {type:XDC file:1 line:41 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN C9 [get_ports {GPI[1]}]
set_property src_info {type:XDC file:1 line:42 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN B9 [get_ports {GPI[2]}]
set_property src_info {type:XDC file:1 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN B8 [get_ports {GPI[3]}]
set_property src_info {type:XDC file:1 line:48 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock [get_clocks clk_out3_mmcm] -min -add_delay 0.000 [get_ports {GPI[*]}]
set_property src_info {type:XDC file:1 line:49 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock [get_clocks clk_out3_mmcm] -max -add_delay 0.000 [get_ports {GPI[*]}]
set_property src_info {type:XDC file:1 line:53 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN G6 [get_ports {GPO[0]}]
set_property src_info {type:XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F6 [get_ports {GPO[1]}]
set_property src_info {type:XDC file:1 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN E1 [get_ports {GPO[2]}]
set_property src_info {type:XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN G3 [get_ports {GPO[4]}]
set_property src_info {type:XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN J4 [get_ports {GPO[3]}]
set_property src_info {type:XDC file:1 line:65 export:INPUT save:INPUT read:READ} [current_design]
set_output_delay -clock [get_clocks clk_out3_mmcm] -min -add_delay 0.000 [get_ports {GPO[*]}]
set_property src_info {type:XDC file:1 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_output_delay -clock [get_clocks clk_out3_mmcm] -max -add_delay 0.000 [get_ports {GPO[*]}]
set_property src_info {type:XDC file:1 line:71 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN A9 [get_ports UARTSin]
set_property src_info {type:XDC file:1 line:72 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN D10 [get_ports UARTSout]
set_property src_info {type:XDC file:1 line:78 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock [get_clocks clk_out3_mmcm] -min -add_delay 0.000 [get_ports UARTSin]
set_property src_info {type:XDC file:1 line:79 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock [get_clocks clk_out3_mmcm] -max -add_delay 0.000 [get_ports UARTSin]
set_property src_info {type:XDC file:1 line:80 export:INPUT save:INPUT read:READ} [current_design]
set_output_delay -clock [get_clocks clk_out3_mmcm] -min -add_delay 0.000 [get_ports UARTSout]
set_property src_info {type:XDC file:1 line:81 export:INPUT save:INPUT read:READ} [current_design]
set_output_delay -clock [get_clocks clk_out3_mmcm] -max -add_delay 0.000 [get_ports UARTSout]
set_property src_info {type:XDC file:1 line:86 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock [get_clocks clk_out3_mmcm] -min -add_delay 2.000 [get_ports resetn]
set_property src_info {type:XDC file:1 line:87 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock [get_clocks clk_out3_mmcm] -max -add_delay 2.000 [get_ports resetn]
set_property src_info {type:XDC file:1 line:90 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN C2 [get_ports resetn]
set_property src_info {type:XDC file:1 line:94 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock [get_clocks clk_out3_mmcm] -min -add_delay 2.000 [get_ports south_reset]
set_property src_info {type:XDC file:1 line:95 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock [get_clocks clk_out3_mmcm] -max -add_delay 2.000 [get_ports south_reset]
set_property src_info {type:XDC file:1 line:98 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN D9 [get_ports south_reset]
set_property src_info {type:XDC file:1 line:128 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN D4 [get_ports SDCCS]
set_property src_info {type:XDC file:1 line:134 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F4 [get_ports SDCIn]
set_property src_info {type:XDC file:1 line:137 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F3 [get_ports SDCCLK]
set_property src_info {type:XDC file:1 line:140 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN D3 [get_ports SDCCmd]
set_property src_info {type:XDC file:1 line:143 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN H2 [get_ports SDCCD]
set_property src_info {type:XDC file:1 line:146 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN G2 [get_ports SDCWP]
set_property src_info {type:XDC file:1 line:165 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins xlnx_ddr3_c0/u_xlnx_ddr3_mig/u_memc_ui_top_axi/mem_intfc0/ddr_phy_top0/u_ddr_calib_top/init_calib_complete_reg/C] -to [get_pins xlnx_proc_sys_reset_0/U0/EXT_LPF/lpf_int_reg/D] 20.000
set_property src_info {type:XDC file:1 line:191 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD DIFF [get_ports ddr3_dqs_p[0]]
set_property src_info {type:XDC file:1 line:192 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD DIFF [get_ports ddr3_dqs_n[0]]
set_property src_info {type:XDC file:1 line:193 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD DIFF [get_ports ddr3_dqs_p[1]]
set_property src_info {type:XDC file:1 line:194 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD DIFF [get_ports ddr3_dqs_n[1]]
set_property src_info {type:XDC file:1 line:212 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD DIFF [get_ports ddr3_ck_p[0]]
set_property src_info {type:XDC file:1 line:213 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD DIFF [get_ports ddr3_ck_n[0]]
set_property src_info {type:XDC file:1 line:223 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN K5 [get_ports ddr3_dq[0]]
set_property src_info {type:XDC file:1 line:224 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN L3 [get_ports ddr3_dq[1]]
set_property src_info {type:XDC file:1 line:225 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN K3 [get_ports ddr3_dq[2]]
set_property src_info {type:XDC file:1 line:226 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN L6 [get_ports ddr3_dq[3]]
set_property src_info {type:XDC file:1 line:227 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN M3 [get_ports ddr3_dq[4]]
set_property src_info {type:XDC file:1 line:228 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN M1 [get_ports ddr3_dq[5]]
set_property src_info {type:XDC file:1 line:229 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN L4 [get_ports ddr3_dq[6]]
set_property src_info {type:XDC file:1 line:230 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN M2 [get_ports ddr3_dq[7]]
set_property src_info {type:XDC file:1 line:231 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V4 [get_ports ddr3_dq[8]]
set_property src_info {type:XDC file:1 line:232 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T5 [get_ports ddr3_dq[9]]
set_property src_info {type:XDC file:1 line:233 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U4 [get_ports ddr3_dq[10]]
set_property src_info {type:XDC file:1 line:234 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V5 [get_ports ddr3_dq[11]]
set_property src_info {type:XDC file:1 line:235 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V1 [get_ports ddr3_dq[12]]
set_property src_info {type:XDC file:1 line:236 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T3 [get_ports ddr3_dq[13]]
set_property src_info {type:XDC file:1 line:237 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U3 [get_ports ddr3_dq[14]]
set_property src_info {type:XDC file:1 line:238 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R3 [get_ports ddr3_dq[15]]
set_property src_info {type:XDC file:1 line:239 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN L1 [get_ports ddr3_dm[0]]
set_property src_info {type:XDC file:1 line:240 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U1 [get_ports ddr3_dm[1]]
set_property src_info {type:XDC file:1 line:241 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN N2 [get_ports ddr3_dqs_p[0]]
set_property src_info {type:XDC file:1 line:242 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN N1 [get_ports ddr3_dqs_n[0]]
set_property src_info {type:XDC file:1 line:243 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U2 [get_ports ddr3_dqs_p[1]]
set_property src_info {type:XDC file:1 line:244 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V2 [get_ports ddr3_dqs_n[1]]
set_property src_info {type:XDC file:1 line:245 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T8 [get_ports ddr3_addr[13]]
set_property src_info {type:XDC file:1 line:246 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T6 [get_ports ddr3_addr[12]]
set_property src_info {type:XDC file:1 line:247 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U6 [get_ports ddr3_addr[11]]
set_property src_info {type:XDC file:1 line:248 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R6 [get_ports ddr3_addr[10]]
set_property src_info {type:XDC file:1 line:249 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V7 [get_ports ddr3_addr[9]]
set_property src_info {type:XDC file:1 line:250 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R8 [get_ports ddr3_addr[8]]
set_property src_info {type:XDC file:1 line:251 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U7 [get_ports ddr3_addr[7]]
set_property src_info {type:XDC file:1 line:252 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V6 [get_ports ddr3_addr[6]]
set_property src_info {type:XDC file:1 line:253 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R7 [get_ports ddr3_addr[5]]
set_property src_info {type:XDC file:1 line:254 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN N6 [get_ports ddr3_addr[4]]
set_property src_info {type:XDC file:1 line:255 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T1 [get_ports ddr3_addr[3]]
set_property src_info {type:XDC file:1 line:256 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN N4 [get_ports ddr3_addr[2]]
set_property src_info {type:XDC file:1 line:257 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN M6 [get_ports ddr3_addr[1]]
set_property src_info {type:XDC file:1 line:258 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R2 [get_ports ddr3_addr[0]]
set_property src_info {type:XDC file:1 line:259 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN P2 [get_ports ddr3_ba[2]]
set_property src_info {type:XDC file:1 line:260 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN P4 [get_ports ddr3_ba[1]]
set_property src_info {type:XDC file:1 line:261 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R1 [get_ports ddr3_ba[0]]
set_property src_info {type:XDC file:1 line:262 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U9 [get_ports ddr3_ck_p[0]]
set_property src_info {type:XDC file:1 line:263 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V9 [get_ports ddr3_ck_n[0]]
set_property src_info {type:XDC file:1 line:264 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN P3 [get_ports ddr3_ras_n]
set_property src_info {type:XDC file:1 line:265 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN M4 [get_ports ddr3_cas_n]
set_property src_info {type:XDC file:1 line:266 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN P5 [get_ports ddr3_we_n]
set_property src_info {type:XDC file:1 line:267 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN K6 [get_ports ddr3_reset_n]
set_property src_info {type:XDC file:1 line:268 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN N5 [get_ports ddr3_cke[0]]
set_property src_info {type:XDC file:1 line:269 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R5 [get_ports ddr3_odt[0]]
set_property src_info {type:XDC file:1 line:270 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U8 [get_ports ddr3_cs_n[0]]
