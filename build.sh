yosys -p 'read_verilog -sv MapDisplayDecoder.sv MapDisplay.sv Display.sv VGA.sv Bomberman.sv ChipInterface.sv; synth_ecp5 -json synth_out.json -top ChipInterface'

nextpnr-ecp5 --12k --json synth_out.json --lpf constraints.lpf --textcfg pnr_out.config

ecppack --compress pnr_out.config bitstream.bit

fujprog bitstream.bit

# to grant permissions:
# chmod u+x build.sh
# to run:
# ./build.sh