set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

cmake_minimum_required(VERSION 3.10)
project(CPP_SAMPLE)
set(PROJECT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(PROJECT_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)

add_executable(${PROJECT_NAME} ${PROJECT_SOURCE_DIR}/main.cpp)
add_library(parent ${PROJECT_SOURCE_DIR}/parent.cpp)
target_include_directories(parent PUBLIC ${PROJECT_INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME} parent)

target_include_directories(${PROJECT_NAME} PRIVATE $ENV{CXX_INCLUDE_PATH})
target_include_directories(${PROJECT_NAME} PRIVATE ${PROJECT_INCLUDE_DIR})