![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/0c58c618-0432-46aa-a57c-7d4c43cf5369)

# Implementation of Binary To Gray Design Model Simulation

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

# Introduction 
> Binary to Gray code conversion is a method used in digital electronics and communication systems to transform binary numbers into Gray code. Gray code is a binary numeral system where consecutive numbers differ by only one bit, making it useful in minimizing errors and noise in various applications. 

# Truth Table
![b_g](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/1e5a6b75-3139-42b0-a33b-99c579ea8dc2)

# RTL design using Verilog with SKY130 Technology

+ Verilog RTL Design: RTL design is a method used in digital circuit design where the behavior of a system is described using a hardware description language (HDL) like Verilog. It focuses on describing how data is transferred and manipulated between registers, representing the functional blocks of a digital system. This abstraction level is closer to the actual hardware implementation, making it suitable for describing complex digital systems.

+ Behavioral vs. RTL: Verilog offers different levels of abstraction for design. Behavioral describes the system's functionality without specifying the details of how it is implemented, while RTL focuses on how data moves between registers and the logic that operates on that data. RTL design provides a higher level of detail and control over the hardware structure.

+ Registers and Combinational Logic: In RTL design, a digital system is composed of registers (flip-flops) that store data and combinational logic that processes the data. The data flow between registers is described using signals and assignments. Combinational logic is described using procedural blocks, where you specify how inputs are transformed into outputs using Verilog statements.

+ Synthesis: Once the RTL description is complete, the design can be synthesized. Synthesis is the process of transforming the RTL description into a gate-level netlist, which represents the design using actual logic gates and flip-flops. This netlist can then be used to create physical layouts for fabrication. Synthesis tools optimize the design for factors like area, power, and timing.

+ Design Hierarchy: Larger systems are often broken down into hierarchical modules, each with its own RTL description. These modules communicate with each other using defined interfaces. This modular approach makes it easier to manage complexity and allows for reusable designs. Hierarchical designs can be synthesized together to create a complete system.

# Introduction to open-source simulator iverilog

+ Iverilog Based Simulation Flow

![iv](https://github.com/Pavan2280/pes_asic_class/assets/131603225/da9c25d9-c1dd-4f47-8e2e-edd5a839e3c8)

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
+ Command to exectue
  ```
  iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v pes_binary_to_gray_net.v pes_binary_to_gray_tb.v
  ./a.out
  gtkwave pes_binary_to_gray_tb.vcd
  ```
  ![3](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/8911a3a9-6b51-4303-a398-dfd596620d34)
