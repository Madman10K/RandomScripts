#!/bin/bash
emerge shaderc glslang spirv-headers spirv-tools vulkan-tools vulkan-loader vulkan-headers vulkan-layers || exit

git clone https://github.com/MadLadSquad/UVKShaderCompiler.git
cd UVKShaderCompiler || exit

sed -i '/ThirdParty\/shaderc/d' CMakeLists.txt
sed -i 's/target_link_libraries(UVKShaderCompilerLib shaderc/target_link_libraries(UVKShaderCompilerLib shaderc_shared/g' CMakeLists.txt

mkdir build || exit
cd build || exit

cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=RELEASE || exit
cpus=$(grep -c processor /proc/cpuinfo)
make -j "${cpus}" || exit
