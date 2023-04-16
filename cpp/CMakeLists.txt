cmake_minimum_required (VERSION 3.11)

# Generate compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(generic)

# Add source to this project's executable.
FILE(GLOB Sources src/*.cpp)
FILE(GLOB Headers src/*.h)
FILE(GLOB HeadersNested src/include/*.h)
set(SOURCES ${Sources} ${Headers} ${HeadersNested})
add_executable(${PROJECT_NAME} ${SOURCES})
