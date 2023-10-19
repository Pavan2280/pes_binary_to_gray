![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/0c58c618-0432-46aa-a57c-7d4c43cf5369)

### Implementation of Binary To Gray Design Model Simulation

#### Welcome to the Binary-to-Gray Design Model Simulation Repository!

# Overview
> This repository is your guide to successfully completing RTL (Register-Transfer Level) and GLS (Gate-Level Simulation) for a binary-to-gray conversion design model. Whether you're a hardware engineer, a student, or a curious tinkerer, this project will help you gain hands-on experience with digital logic design and simulation.

# Purpose
> The primary goal of this project is to provide you with a structured environment for simulating and validating the functionality of a binary-to-gray conversion design at both the RTL and gate-levels. By following the provided instructions, you can gain insights into the workings of digital circuits, test your design, and verify its correctness.

# Getting Started
To start simulating the binary-to-gray design, follow the instructions below:

# Prerequisites installation
Tools Required : gtkwave , iverilog , Yosys

Please enter the following commands in the terminal.
```
sudo apt update
sudo apt upgrade
sudo apt-get install gtkwave
git clone https://github.com/YosysHQ/yosys.git
cd yosys
sudo apt install make
sudo apt-get install build-essential clang bison flex  libreadline-dev gawk tcl-dev libffi-dev git  graphviz xdot pkg-config python3 libboost-system-dev libboost-python-dev libboost-filesystem-dev zlib1g-dev
make config-gcc
make -j 4
```

#### To check if Yosys has been installed correctly, you need to type `yosys` in the terminal, and you should see the expected output as shown in the image below.
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/34a18d42-a8ce-48da-a3d6-1ece9b245802)

**Files** : All the required files for simulation and synthesis are present under [Lib_files](https://github.com/Pavan2280/pes_asic_class/tree/main/Lib_files) folder.

**Note** : For iverilog installation, follow the corresponding part under "run_ubuntu.sh" file under files section

# Introduction to Yosys , Iverilog , GTKWave

1) **Yosys** : Yosys is an open-source synthesis tool.
- It converts RTL (Register Transfer Level) descriptions written in HDL (Hardware Description Language) into optimized gate-level netlists for digital circuit designs.
- Inputs to Yosys include a liberty file (.lib), which describes the characteristics of the target technology library, and a design file written in an HDL.
- The output of Yosys is a synthesized netlist mapped with the provided technology library, which is used for further steps in the digital design flow, such as place and route.

2) **Iverilog** : Iverilog is an open-source Verilog simulation and synthesis tool 
- It allows designers to verify their digital designs using simulation and generate netlists for synthesis.
- Inputs to Iverilog include testbench and design files written in Verilog.
- The output of Iverilog is typically a VCD (Value Change Dump) file. VCD files store data related to simulation, such as signal value changes, and are used for waveform visualization and analysis.
  
3) **GTKWave** : GTKWave is an open-source waveform viewer.
- It provides graphical visualization of simulation results produced by digital design simulation tools like Iverilog.
- Inputs to GTKWave include VCD files, which store simulation data.
- The output of GTKWave is a graphical waveform view that helps designers debug and analyze the behavior of digital circuits during simulation.

# Introduction to Binary to Gray Converter
> Binary to Gray code conversion is a method used in digital electronics and communication systems to transform binary numbers into Gray code. Gray code is a binary numeral system where consecutive numbers differ by only one bit, making it useful in minimizing errors and noise in various applications. 

# Truth Table
![b_g](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/1e5a6b75-3139-42b0-a33b-99c579ea8dc2)

# Introduction to open-source simulator iverilog
+ Iverilog Based Simulation Flow
![iv](https://github.com/Pavan2280/pes_asic_class/assets/131603225/da9c25d9-c1dd-4f47-8e2e-edd5a839e3c8)

# Code SS
![4](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/35caa7a6-746e-4b5c-ab6a-a9f84b436816)
![5](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/03497447-33ee-4d25-809f-2f6f79f325b0)

# RTL Simulation :
> RTL simulation is primarily used for verifying the correctness of a digital design. It allows designers to test and debug their designs before they are implemented in hardware. This helps in catching and rectifying design errors early in the development process, which can save time and resources.

+ Command to exectue
  ```
  iverilog pes_binary_to_gray.v pes_binary_to_gray_tb.v                                                                                                      
  ./a.out                                                                                                                                            
  gtkwave pes_binary_to_gray_tb.vcd
  ```
  ![1](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/ac5938d1-8482-4a0d-8e56-3bbf7050143e)

# RTL Synthesis :
> RTL synthesis, which stands for Register-Transfer Level synthesis, is a crucial phase in the digital design process, specifically within the field of electronic design automation (EDA). RTL synthesis involves translating a high-level RTL description of a digital circuit (usually described in languages like VHDL or Verilog) into a gate-level representation that can be implemented in hardware.

+ Introduction to Yosys and Logic Synthesis
![y](https://github.com/Pavan2280/pes_asic_class/assets/131603225/96f84104-686e-4497-8c35-352a29b36268)

+ To Verify Synthesis
![y2](https://github.com/Pavan2280/pes_asic_class/assets/131603225/5a3c649c-50c6-4795-8175-866ecd2e82a8)

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
> Gate Level Simulation (GLS) is a crucial step in the electronic design verification process, especially in the context of digital integrated circuits. It is used for post-synthesis verification to ensure that the synthesized design meets the desired functionality and timing requirements.
+ Command to exectue
  ```
  iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v pes_binary_to_gray_net.v pes_binary_to_gray_tb.v
  ./a.out
  gtkwave pes_binary_to_gray_tb.vcd
  ```
  ![3](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/8911a3a9-6b51-4303-a398-dfd596620d34)
