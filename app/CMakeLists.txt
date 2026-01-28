cmake_minimum_required(VERSION 3.15)
project(app)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(fmt REQUIRED)

add_executable(app main.cpp)

target_link_libraries(app PRIVATE fmt::fmt)

target_include_directories(app PRIVATE ${CMAKE_SOURCE_DIR})