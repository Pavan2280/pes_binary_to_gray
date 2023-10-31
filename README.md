![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/0c58c618-0432-46aa-a57c-7d4c43cf5369)

## Implementation of Binary To Gray Design Model Simulation

#### Welcome to the Binary-to-Gray Design Model Simulation Repository!

# Overview
> This repository is your guide to successfully completing RTL (Register-Transfer Level) and GLS (Gate-Level Simulation) for a binary-to-gray conversion design model. Whether you're a hardware engineer, a student, or a curious tinkerer, this project will help you gain hands-on experience with digital logic design and simulation.

# Purpose
> The primary goal of this project is to provide you with a structured environment for simulating and validating the functionality of a binary-to-gray conversion design at both the RTL and gate-levels. By following the provided instructions, you can gain insights into the workings of digital circuits, test your design, and verify its correctness.

# Introduction to Binary to Gray Converter
> Binary to Gray code conversion is a method used in digital electronics and communication systems to transform binary numbers into Gray code. Gray code is a binary numeral system where consecutive numbers differ by only one bit, making it useful in minimizing errors and noise in various applications. 

## Prerequisites Installation - For Stage 1 (RTL-GLS Simulation)
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

<a name="Stage-1"></a>

## Stage 1 (RTL-GLS Simulation) - Table of contents

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
[Back to Stage-1](#Stage-1)
</details>

<details>
<summary>Code Snapshots</summary>
<br>

![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/274ccee5-38fa-4a64-8a07-4df6e6e2a3b2)
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/1f3f537e-005e-4560-8b84-af913001654f)
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/b06f751d-96f5-4767-a0ee-d38b48ff05c0)


[Back to Stage-1](#Stage-1)
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

[Back to Stage-1](#Stage-1)
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

[Back to Stage-1](#Stage-1)
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

[Back to Stage-1](#Stage-1)
</details>

## Prerequisites Installation - For Stage 2 (RTL2GDSII - OPENLANE)

#### Magic Installation
For magic installation please enter the following commands in the terminal.
```
sudo apt-get install m4
sudo apt-get install tcsh
sudo apt-get install csh
sudo apt-get install libx11-dev
sudo apt-get install tcl-dev tk-dev
sudo apt-get install libcairo2-dev
sudo apt-get install mesa-common-dev libglu1-mesa-dev
sudo apt-get install libncurses-dev
git clone https://github.com/RTimothyEdwards/magic
cd magic
./configure
sudo make
sudo make install
```
#### Ngspice Installation
For ngspice installation please enter the following commands in the terminal.
```
sudo apt install ngspice
```

#### Openlane-2 Installation

The original Documentation can be found here [OpenLane Installation](https://openlane.readthedocs.io/en/latest/getting_started/installation/installation_ubuntu.html)

For Opelane-2 installation please enter the following commands in the terminal.

#### Installing the pre-requisites
```
sudo apt-get update
sudo apt-get upgrade
sudo apt install -y build-essential python3 python3-venv python3-pip make git
```

#### Uninstall conflicting packages of docker if present
```
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

#### Install Docker using apt repository
+ Setup Docker's apt repository
```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
+ Install other packages
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
+ Verify that the Docker Engine installation is successful by running the hello-world image.
```
sudo docker run hello-world
```

**A successfull installation would look like**

![Screenshot from 2023-10-31 14-19-01](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/42dee311-55ff-4fe5-a402-9c31a31ed837)

+ Making Docker available without root (Linux)
```
sudo groupadd docker
sudo usermod -aG docker $USER
sudo reboot # REBOOT!
```
+ Checking the docker installation after reboot
```
docker run hello-world
```
**A successfull installation would look like**
![Screenshot from 2023-10-31 14-24-36](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/7d747449-ca98-4fc8-b4b7-cfaf4c02beab)

+ Checking Installation Requirements
```
git --version
docker --version
python3 --version
python3 -m pip --version
make --version
python3 -m venv -h
```
![Screenshot from 2023-10-31 14-25-01](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/19c993aa-6a83-4303-96ef-31908a576062)

#### Download and Install Openlane
Run these one after the other
```
git clone --depth 1 https://github.com/The-OpenROAD-Project/OpenLane.git
cd OpenLane/
make
make test
```
**Upon successful completion of the test, you will receive a 'Basic test passed' confirmation, indicating that you are now ready to use OpenLane2.**
![Screenshot from 2023-10-31 14-29-13](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/5dce98c3-5623-4621-9f00-adae009f7429)

<b name="Stage-2"></b>

## Stage 2 (RTL2GDSII - OPENLANE) - Table of contents

<details>
<summary>Openlane ASIC Design Flow</summary>
<br>

![image](https://github.com/Pavan2280/pes_pd/assets/131603225/24e63c09-da0d-4da6-943c-f54d6abbda85)

#### Design Stages

1) **Synthesis**
   1. **yosys** - Yosys performs RTL synthesis, converting high-level RTL descriptions into gate-level netlists.
   2. **abc** - ABC is used for further optimization and technology mapping to enhance the gate-level design.
   3. **OpenSTA** - OpenSTA conducts static timing analysis to verify if the synthesized design meets timing constraints in the OpenLane flow.

2) **Floorplan & PND**
   1. **init_fp (Initial Floorplan)** - Floorplanning involves determining the initial placement and arrangement of various functional blocks or cells within the chip's       
   layout area.
   2. **ioplacer** - ioplacer is a tool used in the physical design process to place Input/Output (I/O) pads or pins on the chip's boundary.
   3. **pdn** - The PDN is responsible for distributing power (supply voltage) and ground (reference voltage) throughout the chip, ensuring that all components receive the       necessary power supply and maintain stable electrical operation.
   4. **tapcell** - A "tapcell" is a special type of cell used in digital integrated circuit design, particularly in standard cell libraries.It is typically used to create 
   tap connections for the bulk terminals in digital CMOS (Complementary Metal-Oxide-Semiconductor) designs.

3) **Placement**
   1. **Replace** - RePlace is a tool used in the OpenLane flow for cell placement optimization.It focuses on optimizing the placement of standard cells within the chip's   
   layout to achieve better area utilization, timing, and power efficiency.
   2. **Resizer** - Resizer is a tool employed during the physical design process to perform cell resizing and optimization.
   3. **OpenDP (Open Detailed Placement)** - OpenDP, or Open Detailed Placement, is a detailed placement tool used in OpenLane.It is responsible for the fine-grained 
   placement of cells, ensuring that they are precisely positioned within rows and tracks while adhering to design constraints and achieving optimal utilization of the chip's 
   layout area.
   4. **OpenPhysyn (Open Physical Synthesis)** - OpenPhysyn is a tool within OpenLane that performs physical synthesis tasks.It optimizes the logical and physical aspects of 
   the design simultaneously, improving the placement, power, area, and timing by considering both logic and physical information during the optimization process.

4) **CTS**
   1. **TritonCTS** - TritonCTS generates a clock distribution network.

5) **Routing**
   1. **FastRoute** - FastRoute is a global routing tool used in the physical design stage of ASIC chip design.
   2. **TritonRoute** - TritonRoute is a detailed or global routing tool used in the later stages of ASIC chip design, following placement and initial global routing.
   
6) **GDSII Generation**
   1. **Magic** - Magic is primarily a layout tool used for creating and editing IC layouts, and it is often used for digital CMOS design.
   2. **KLayout** - KLayout is primarily used for viewing, editing, and analyzing IC layouts but is not a layout creation tool like Magic.
   
8) **Checks**
   1. **CVC** - CVC is a tool primarily used for verification and debugging of digital designs.
   2. **Netgen** - Netgen is an open-source digital netlist comparison and LVS (Layout vs. Schematic) tool.

[Back to Stage-2](#Stage-2)
</details>

Create a new folder within OpenLane with the same name as your design file `pes_binary_to_gray_converter`, please follow these steps.
```
cd OpenLane
cd designs
ls
cd pes_binary_to_gray_converter
ls
```
The `pes_binary_to_gray_converter` should have these files that is `config.json`, `pes_binary_to_gray_converter.v` and the `src` folder.
The `src` folder should contain all these files 
![Screenshot from 2023-10-31 21-30-11](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/98f84586-8ac3-4e9c-afeb-583c57c075c0)



[Back to Stage-2](#Stage-2)
</details>
