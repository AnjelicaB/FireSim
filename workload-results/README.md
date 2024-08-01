# Workload result summary

## tutorial(resnet50)
Hardware I used
- **Rocket** -> just a Rocket core
- **Gemmini Rocket** -> Weight stationary, lean gemmini, Rocket SoC

Workloads I used:
- **Resnet50 CPU** -> should run Resnet50 on the CPU
  - Failed on Rocket
  - Runs really slowly on Gemmini -> FlameGraph shows that majority of work is performed on Linux Userspace, which makes sense as it is only running on CPU
- **Resnet50 OS** -> run on Gemmini (output stationary)
  - Not tested on Rocket
  - Failed on Gemmini (because workload is OS, hardware is WS)
- **Resnet50 WS** -> run on Gemmini (weight stationary)
  - Not tested on Rocket
  - Runs well on Gemmini -> FlameGraph shows Linux Kernel space is used, handeling page faults and TLB misses 
- **Resnet50 Test** -> a bad argument, so the program should fail
  - Not tested on Rocket
  - Failed on Gemmini (just as expected)

## matmul
Hardware I used
- **Gemmini Rocket** -> Weight stationary, lean gemmini, Rocket SoC
- **Medium Gemmini Rocket** -> Output stationary, Rocket SoC
- **Medium Gemmini Rocket w/ default AutoCounter** -> ...coming soon!...
- **Medium Gemmini Rocket w/ custom AutoCounter** -> ...coming soon!...

Workloads I used:
- **Simple-Matmul** -> Simple matrix multiply, output stationary
  - Incorrect result on Gemmini (because workload is OS, hardware is WS)
  - Correct result on Medium Gemmini
- **Simple-Matmul-fence** -> same program with fences, should run slower
  - Incorrect result on Gemmini (because workload is OS, hardware is WS)
  - Correct result on Medium Gemmini, but cycle number is off ...work in progress...