## Instructions
- Put the two `.c` files in the `chipyard/generators/gemmini/software/gemmini-rocc-tests/bareMetalC/` directory
- Before Running `run.sh`, be sure to build the Gemmini hardware using Verilator or Spike. Even though we already built the hardware with Firesim, building it with Verilator/Spike will generate a header files used by these workloads. Instructions on how to build it is [here](https://github.com/ucb-bar/gemmini)
  - **DO NOT** checkout to Chipyard 1.9.1 even though it's stated in Gemmini's repo
  - If you want to build your custom Gemmini config, specify it in `chipyard/generators/gemmini/src/main/scala/gemmini/CustomConfigs.scala`, at `val customConfig = <your_config>`