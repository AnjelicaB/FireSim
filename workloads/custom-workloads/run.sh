{
echo "build and install on firesim"

temp=$( realpath "$0"  ) && 
cd $( dirname "$temp" )/marshal-configs
ls

echo "
---------------
matmul
---------------
"

# # Test1: on Firesim no trigger
marshal build matmul-linux.yaml &&
marshal install matmul-linux.yaml &&

# Test3: on Firesim instruction trigger
marshal build matmul-linux-Tr.yaml &&
marshal install matmul-linux-Tr.yaml &&

echo "
---------------
matmul fence
---------------
"
## Test1: on spike
marshal build matmul_fence-linux.yaml &&
marshal install matmul_fence-linux.yaml &&

# # Test2: on Firesim no trigger
marshal build matmul_fence-linux-Tr.yaml &&
marshal install matmul_fence-linux-Tr.yaml
} > log.txt 2>&1
