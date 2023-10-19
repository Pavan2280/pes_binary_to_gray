# Implementation of Binary To Gray Converter
> Binary to Gray code conversion is a method used in digital electronics and communication systems to transform binary numbers into Gray code. Gray code is a binary numeral system where consecutive numbers differ by only one bit, making it useful in minimizing errors and noise in various applications. 

# Truth Table
![b_g](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/1e5a6b75-3139-42b0-a33b-99c579ea8dc2)

# Code SS
![4](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/35caa7a6-746e-4b5c-ab6a-a9f84b436816)
![5](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/03497447-33ee-4d25-809f-2f6f79f325b0)

# RTL Simulation :
+ Command to exectue
  ```
  iverilog pes_binary_to_gray.v pes_binary_to_gray_tb.v                                                                                                      
  ./a.out                                                                                                                                            
  gtkwave pes_binary_to_gray_tb.vcd
  ```
  ![1](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/ac5938d1-8482-4a0d-8e56-3bbf7050143e)

# RTL Synthesis :
+ Command to exectue
  ```
  yosys                                                                                                                                                 
  read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib                                                                
  read_verilog pes_binary_to_gray.v                                                                                                                   
  synth -top pes_binary_to_gray                                                                                                                           
  abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib                                                                
  write_verilog -noattr pes_binary_to_gray_net.v
  show
  ```
  ![2](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/df3e4a18-2ff7-41ea-9b65-3352110e2948)
  ![6](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/4b853bb2-8a77-46b1-8bf3-7c97dcf5d103)
  
# GLS Simulation:
+ Command to exectue
  ```
  iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v pes_binary_to_gray_net.v pes_binary_to_gray_tb.v
  ./a.out
  gtkwave pes_binary_to_gray_tb.vcd
  ```
  ![3](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/8911a3a9-6b51-4303-a398-dfd596620d34)
