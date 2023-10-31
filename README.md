![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/0c58c618-0432-46aa-a57c-7d4c43cf5369)

## Implementation of Binary To Gray Design Model Simulation

#### Welcome to the Binary-to-Gray Design Model Simulation Repository!

# Overview
> This repository is your guide to successfully completing RTL (Register-Transfer Level) and GLS (Gate-Level Simulation) for a binary-to-gray conversion design model. Whether you're a hardware engineer, a student, or a curious tinkerer, this project will help you gain hands-on experience with digital logic design and simulation.

# Purpose
> The primary goal of this project is to provide you with a structured environment for simulating and validating the functionality of a binary-to-gray conversion design at both the RTL and gate-levels. By following the provided instructions, you can gain insights into the workings of digital circuits, test your design, and verify its correctness.

# Introduction to Binary to Gray Converter
> Binary to Gray code conversion is a method used in digital electronics and communication systems to transform binary numbers into Gray code. Gray code is a binary numeral system where consecutive numbers differ by only one bit, making it useful in minimizing errors and noise in various applications. 

## Prerequisites Installation - GTKWave , Iverilog , Yosys
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

**To check if Yosys has been installed correctly, you need to type `yosys` in the terminal, and you should see the expected output as shown in the image below.**
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/34a18d42-a8ce-48da-a3d6-1ece9b245802)

**Files** : All the required lib files for simulation and synthesis are present under [Lib_files](https://github.com/Pavan2280/pes_binary_to_gray/tree/main/Lib_files) folder.

**Note** : For iverilog installation, follow the corresponding part under "run_ubuntu.sh" file under files section

<a name="top"></a>

# Stage 1 - Table of contents

<details>
<summary>Introduction to Yosys , Iverilog , GTKWave</summary>
<br>
  
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

**Simple block diagram for Iverilog Based Simulation Flow**
![iv](https://github.com/Pavan2280/pes_asic_class/assets/131603225/da9c25d9-c1dd-4f47-8e2e-edd5a839e3c8)

**Simple block diagram for Yosys and Logic Synthesis**
![y](https://github.com/Pavan2280/pes_asic_class/assets/131603225/96f84104-686e-4497-8c35-352a29b36268)

**Simple block diagram to Verify Synthesis**
![y2](https://github.com/Pavan2280/pes_asic_class/assets/131603225/5a3c649c-50c6-4795-8175-866ecd2e82a8)
[Back to Top](#top)
</details>

<details>
<summary>Code Snapshots</summary>
<br>

![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/274ccee5-38fa-4a64-8a07-4df6e6e2a3b2)
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/1f3f537e-005e-4560-8b84-af913001654f)
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/b06f751d-96f5-4767-a0ee-d38b48ff05c0)


[Back to Top](#top)
</details>

<details>
<summary>RTL Simulation</summary>
<br>
  
> RTL simulation is primarily used for verifying the correctness of a digital design. It allows designers to test and debug their designs before they are implemented in hardware. This helps in catching and rectifying design errors early in the development process, which can save time and resources.

+ Command to exectue
```
iverilog pes_binary_to_gray_converter.v pes_binary_to_gray_converter_tb.v                                                                                                      
./a.out                                                                                                                                            
gtkwave pes_binary_to_gray_converter_tb.vcd
```
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/2e58a07f-53f6-45e2-a181-c1f27dab03f9)
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/9a0b70aa-8156-49e3-9fbc-aad584d0af7a)

[Back to Top](#top)
</details>

<details>
<summary>RTL Synthesis</summary>
<br>
  
> RTL synthesis, which stands for Register-Transfer Level synthesis, is a crucial phase in the digital design process, specifically within the field of electronic design automation (EDA). RTL synthesis involves translating a high-level RTL description of a digital circuit (usually described in languages like VHDL or Verilog) into a gate-level representation that can be implemented in hardware.

+ Command to exectue
```
yosys                                                                                                                                                 
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog pes_binary_to_gray_converter.v                                                                                                                   
synth -top pes_binary_to_gray_converter                                                                                                                           
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib                                                                
write_verilog -noattr pes_binary_to_gray_converter_net.v
show
```
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/a167d38f-4871-43b4-960f-17d4466c231e)
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/769d13b7-6a53-414d-8cdc-1212dbc6b97e)

[Back to Top](#top)
</details>

<details>
<summary>GLS Simulation</summary>
<br>

> Gate Level Simulation (GLS) is a crucial step in the electronic design verification process, especially in the context of digital integrated circuits. It is used for post-synthesis verification to ensure that the synthesized design meets the desired functionality and timing requirements.

+ Command to exectue
```
iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v pes_binary_to_gray_converter_net.v pes_binary_to_gray_converter_tb.v
./a.out
gtkwave pes_binary_to_gray_converter_tb.vcd
```
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/b349e39e-49fe-4a65-941d-f696039ea05d)
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/f275793a-e4de-4f47-82c2-d55f4b00e670)

[Back to Top](#top)
</details>

# Stage 2 - Table of contents
## Prerequisites Installation - Openlane2,Ngspice,Magic

Please enter the following commands in the terminal.
```

```
<details>
<summary></summary>
<br>

[Back to Top](#top)
</details>
