cmake_minimum_required(VERSION 3.15)
project(hello_symengine LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)

add_executable(hello_world hello_world.cpp)

# Use x64-windows triplet
set(VCPKG_TRIPLET "x64-windows")


# Add include directories
target_include_directories(hello_world PRIVATE
    "${CMAKE_SOURCE_DIR}/vcpkg_installed/${VCPKG_TRIPLET}/include"
)

# Link libraries based on build configuration
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_link_libraries(hello_world PRIVATE
        "${CMAKE_SOURCE_DIR}/vcpkg_installed/${VCPKG_TRIPLET}/debug/lib/symengine.lib"
        "${CMAKE_SOURCE_DIR}/vcpkg_installed/${VCPKG_TRIPLET}/debug/lib/gmp.lib"
        "${CMAKE_SOURCE_DIR}/vcpkg_installed/${VCPKG_TRIPLET}/debug/lib/mpfr.lib"
        "${CMAKE_SOURCE_DIR}/vcpkg_installed/${VCPKG_TRIPLET}/debug/lib/arb.lib"
        "${CMAKE_SOURCE_DIR}/vcpkg_installed/${VCPKG_TRIPLET}/debug/lib/flint.lib"
    )
else()
    target_link_libraries(hello_world PRIVATE
        "${CMAKE_SOURCE_DIR}/vcpkg_installed/${VCPKG_TRIPLET}/lib/symengine.lib"
        "${CMAKE_SOURCE_DIR}/vcpkg_installed/${VCPKG_TRIPLET}/lib/gmp.lib"
        "${CMAKE_SOURCE_DIR}/vcpkg_installed/${VCPKG_TRIPLET}/lib/mpfr.lib"
        "${CMAKE_SOURCE_DIR}/vcpkg_installed/${VCPKG_TRIPLET}/lib/arb.lib"
        "${CMAKE_SOURCE_DIR}/vcpkg_installed/${VCPKG_TRIPLET}/lib/flint.lib"
    )
endif()

