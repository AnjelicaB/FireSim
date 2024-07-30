# FireSim
Working in Firesim to analyse memory behavior of various SoCs

## Prefetching/Dependencies
- Chipyard 1.11.0 (this version of chipyard supports the most recent version of Firesim, but does not support full Gemmini functionalities)
- Follow all initial setup for Chipyard 1.11.0
- Follow the set up guide (excluding the repo setup) for Firesim 1.18.0 for U280 FPGA

- This project specifically uses Xilinx U280 FPGA

## Workloads
This is a folder with all workloads used in this projects. Put the contents of the workloads directory in `chipyard/software` 

You will notice these folders:
- **tutorial** -> uses Gemmini's imagenet/resnet50 programs (based off of Firesim workshop at ASPLOS 2023)
- **customworkloads** -> two simple matrix multiplication programs from [this repository](https://github.com/stevenyuser/gemmini-stuff/tree/main)

In each folder, there are these files:
- **marshal-configs** -> config files FireMarshal uses to generate workloads
- **build.sh** -> bash script to build software workloads used in Firesim
- **run.sh** -> bash script to automate building and installation of workloads into Firesim

