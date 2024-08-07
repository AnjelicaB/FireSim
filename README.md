# FireSim
Working in Firesim to analyse memory behavior of various SoCs. This repository summarizes all key updates. To view my working repository go to [chipyard-a](https://github.com/AnjelicaB/chipyard-a.git)

## Prefetching/Dependencies
- Chipyard 1.11.0 (this version of chipyard supports the most recent version of Firesim, but does not support full Gemmini functionalities)
- Follow all initial setup for Chipyard 1.11.0
- Follow the set up guide (excluding the repo setup) for Firesim 1.18.0 for U280 FPGA
- This project specifically uses Xilinx U280 FPGA

Below, I will describe what each directory means.

## Firesim
This folder contains the build config files and results of bitstreams I used that no not come with the Chipyard 1.11.0 repository. 

You will find these three files/directorys:
- **config_build_recipes.yaml** -> the details related to each build
- **config_hwdb.yaml** -> references the location of the build, which is used when launching a Firesim simulation
- **results-build** -> completed builds as described in `config_build_recipes.yaml`, referenced by `config_hwdb.yaml`

You should unzip and add the contents of this `results-build` folder in `chipyard/sims/firesim/deploy/results-build` in your chipyard repository. You should add the contents of the two config.yaml files underneath the existing config files in located in `chipyard/sims/firesim/deploy`.

## generators
This is a folder with all of the hardware configurations added to the existing Chipyard repository, for the purpose of this project.

You will find these three files/directorys:
- **gemmini** -> all modified gemmini config files. Append the contents of these files to their corresponding files in `chipyard/generators/gemmini/src/main/scala/gemmini` of your chipyard repository
- **chipyard** -> all modified chipyard SoC config files. Append the contents to their corresponding files in `chipyard/generators/chipyard/src/main/scala/config`
- **firechip** -> all modified firechip config files. This bridges between your chipyard SoC and Firesim. Append the contents to their corresponding files in `chipyard/generators/firechip/src/main/scala`

## Workloads
This is a folder with all workloads used in this projects. Put the contents of the workloads directory in `chipyard/software`.

You will notice these folders:
- **tutorial** -> uses Gemmini's imagenet/resnet50 programs (based off of Firesim workshop at ASPLOS 2023)
  - key findings located in `'workload results'/tutorial(resnet50)`
- **custom-workloads** -> two simple matrix multiplication programs from [this repository](https://github.com/stevenyuser/gemmini-stuff/tree/main)
  - key findings located in `'workload results'/matmul`

In each folder, there are these files:
- **marshal-configs** -> config files FireMarshal uses to generate workloads
- **build.sh** -> bash script to build software workloads used in Firesim
- **run.sh** -> bash script to automate building and installation of workloads into Firesim
- If there are additional files, there will also be a **README** to explain them

## Workload Results
This folder contains the most important results after running a Firesim workload. In your chipyard directory, these results can be found in `chipyard/sims/firesim/deploy/results-workload`.

You will find these files/directorys:
- **README** -> a file that summarizes key findings
- **tutorial(resnet50)** -> results from running the workloads in the `workloads/tutorial` folder
- **matmul** -> results from running the workloads in the `workloads/customworkloads` folder
The folders inside each directies refer to the builds. The results of each workload can be found in their corresponding folders.
