cmake_minimum_required(VERSION 3.0.0)
project(loja_virtual_Selim VERSION 0.1.0)

include(CTest)
enable_testing()

add_library(loja_virtual_Selim loja_virtual_Selim.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
