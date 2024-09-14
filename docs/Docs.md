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

Traditionally, we have FPGA prototyping and software simulation. Both fields are explored in ECE 2300. Software simulators like Verilator checks for functional correctness - whether the chip does what we want it to do, but doesn't provide enough insights to how the chip will perform in real life. FPGA prototyping as mentioned earlier is constrained by the resources on the FPGA. Depending on how your FPGA is designed, you'll get different results. 

FireSim allow us to simulate the chip to check for its functional correctness. It is also designed to be deterministic - using different FPGAs will yield the same result. It emulates the chip so that we can introspect into its behavior.

### How does FireSim do that?

In ECE 2300, we often only design the 
FireSim represents yoru target design like a data flow graph
