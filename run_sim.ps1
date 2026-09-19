xvlog -sv "source code\CACHE_CONTROLLER.sv" "source code\L1_CACHE_MEMORY.sv" "source code\L2_CACHE_MEMORY.sv" "source code\MAIN_MEMORY.sv" "sim files\TB_READ.sv"
xelab -debug typical TB_READ -s tb_sim
xsim tb_sim -R
