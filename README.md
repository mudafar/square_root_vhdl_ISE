# Square root vhdl

##Description:
  Calculate the square root of unsigned number (16 bit), using bit by bit algorithm.
  
  When there is no exact square root, only the integer part of the approximated value is given.
  
  
*  Input:
    The 8 switch from right to left, representing the first 8 bits of the data_input.
  
*  Output:  
    The result is shown on the 7 segment display (up to 3 digits)    



##Project Structure:
  The folder contain all files needed for the ISE project strcture, just use "Open Project"



##MISC:
To flash the FPGA use:
  djtgcfg -d DOnbUsb prog -i 0 -f /raizcuadrada/squart.bit 


##FPGA:
  Maked and tested for Nexys2 - XILINIX Spartan 3E-500 FG320 



