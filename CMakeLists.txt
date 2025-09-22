cmake_minimum_required(VERSION 3.15)
project(hello_symengine LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)

add_executable(hello_world hello_world.cpp)

# Add include directories manually
target_include_directories(hello_world PRIVATE
    "${CMAKE_SOURCE_DIR}/vcpkg_installed/x64-windows-release/include"
)

# Link libraries manually
target_link_libraries(hello_world PRIVATE
    "${CMAKE_SOURCE_DIR}/vcpkg_installed/x64-windows-release/lib/symengine.lib"
    "${CMAKE_SOURCE_DIR}/vcpkg_installed/x64-windows-release/lib/gmp.lib"
    "${CMAKE_SOURCE_DIR}/vcpkg_installed/x64-windows-release/lib/mpfr.lib"
    "${CMAKE_SOURCE_DIR}/vcpkg_installed/x64-windows-release/lib/arb.lib"
    "${CMAKE_SOURCE_DIR}/vcpkg_installed/x64-windows-release/lib/flint.lib"
)