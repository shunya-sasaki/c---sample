add_library(Parent)
target_sources(Parent PRIVATE parent.cpp)
target_include_directories(Parent PUBLIC ${CMAKE_SOURCE_DIR}/include)

add_executable(Main)
target_sources(Main PRIVATE main.cpp)
target_include_directories(Parent PUBLIC ${CMAKE_SOURCE_DIR}/include)
target_link_libraries(Main PRIVATE Parent)