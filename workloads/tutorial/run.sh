{
echo "build and install on firesim"

temp=$( realpath "$0"  ) && 
cd $( dirname "$temp" )/marshal-configs
ls

echo "
---------------
cpu
---------------
"
## Test1: on spike
# marshal -d build resnet50-cpu-linux.yaml
# marshal -d launch -s resnet50-cpu-linux.yaml

# # Test2: on Firesim no trigger
# marshal build resnet50-cpu-linux.yaml
# marshal install resnet50-cpu-linux.yaml

# Test3: on Firesim instruction trigger
marshal build resnet50-cpu-linux-FG.yaml
marshal install resnet50-cpu-linux-FG.yaml

echo "
---------------
os
---------------
"
## Test1: on spike
# marshal -d build resnet50-os-linux.yaml
# marshal -d launch -s resnet50-os-linux.yaml

# # Test2: on Firesim no trigger
# marshal build resnet50-os-linux.yaml
# marshal install resnet50-os-linux.yaml

echo "
---------------
ws
---------------
"
## Test1: on spike
# marshal -d build resnet50-ws-linux.yaml
# marshal -d launch -s resnet50-ws-linux.yaml

# # Test2: on Firesim no trigger
# marshal build resnet50-ws-linux.yaml
# marshal install resnet50-ws-linux.yaml

# Test3: on Firesim instruction trigger
marshal build resnet50-ws-linux-FG.yaml
marshal install resnet50-ws-linux-FG.yaml

echo "
---------------
bad arg
---------------
"
## Test1: on spike
# marshal -d build resnet50-test-linux.yaml
# marshal -d launch -s resnet50-test-linux.yaml

# # Test2: on Firesim no trigger
# marshal build resnet50-test-linux.yaml
# marshal install resnet50-test-linux.yaml
} > log.txt 2>&1
