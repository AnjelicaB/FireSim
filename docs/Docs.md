# FireSim Tutorial and Documentation

Here I aim to provide a more beginner friendly tutorial to Firesim, including:
1. [Theory of FireSim](https://github.com/AnjelicaB/FireSim/blob/main/Docs.md#L12)
2. How to set it up
3. FireSim commands
4. Building custom designs and Chipyard repository
5. Custom workloads using FireMarshal
6. Profiling with FireSim
7. Suggestions for next steps

## 1. Theory of FireSim

I'll be using these terminology throughout, here's the definition you can refer back to: 
- **Target** → the design I’m trying to emulate
- **Host** → the FPGA I’m emulating the design on (U280)

### What is FireSim?

FireSim is a tool that emulates a System on Chip (SoC). It uses the logic block on the FPGA to model the RTL of your chip. Like in ECE 2300, it is able to simulate your chip performing a program, commonly known as "FPGA prototyping". But more importantly than simulating your design, FireSim allows cycle-accurate emulation of your design. This means that it provides tools to introspect the behavior of the chip after every clock cycle. At the end of the day, we want to **validate the chip** and **understand its behavior**.

### Don't we already have tools to simulate our chips?

Traditionally, we have software simulation and FPGA prototyping. Both fields are explored in ECE 2300. Software simulators like Verilator checks for functional correctness - whether the chip does what we want it to do, but doesn't provide enough insights to how the chip will interact with other components. FPGA prototyping as mentioned earlier is constrained by the resources on the FPGA. It models your chip and uses the resources on the FPGA to model the peripherals. Depending on how your FPGA is designed, you'll get different results. 

Imagine a Chipotle, and I want to understand how well the Chipotle will perform if I open a store in downtown Manhattan. I can't examine the Chipotle in Ithaca, because the population in Ithaca is very different from Manhattan.

In ECE 2300, we often only examine the chip itself, which usually only includes the compute unit, ignoring other important units like the memory, network and I/O devices. But real-world chips interact with other components, and these interactions determine the performance of your chip. FireSim allow us to simulate the entire environment - the chip as well as how it interact with its designated peripherials, not the peripherials on the FPGA. Therefore, it is designed to be deterministic - using different FPGAs will yield the same result. It emulates the chip so that we can introspect into its behavior.

### How does FireSim do that?

As mentioned earlier, you entire target design (SoC) is just the chip, but it interacts with a bunch of components, including the CPU, DRAM, I/O and other periperials. FireSim interprets each of these components as a model and how these models interact with eachother. In FireSim's terms, this is called a **Target Flow Graph**. This graph is composed of:
1. Models
2. Channels
3. Tokens
   
The models are the various components, the tokens are the inputs and outputs between each model, and the channels are how the tokens are transported. Imagin a world where the only mode of transportation is airplanes. The models are the cities, tokens are people, and channels are the airplanes. The target flow graph just describes the movement of people within the cities.

In general, we would have one model that represents the chip, another model for memory and another model for IO etc. FireSim controls the flow of tokens between the models in each clock cycle, so that for every cycle, the flow of tokens between the models accurately represents the flow of data on your SoC. This way, for every cycle, the modeled chip will have the same performance as designed. Back to the airport analogy, imagine controlling the flow of tokens as airport customs. No matter how busy the airport is, the airplanes will only carry the number of customers it is planned to carry. So the number of people coming in and out of your city is irrespective of how busy the other cities are. This is called, latency-insensitivity.

Often times the FPGA does not have enough resources to model the entire SoC/target flow graph if they are all explicitly expressed in hardware RTL. What FireSim did to work around this is to not use explicitly RTL model for the entire design. Instead, only your chip will be expressed in hardware RTL, and the peripherals (including DRAM) are modeled using abstract RTL or software. To put it simply, abstract RTL and software model the functionality and performance of your target, instead of registers and clocks. 
