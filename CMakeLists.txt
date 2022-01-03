cmake_minimum_required(VERSION 2.4)

project(glutess)

FILE(GLOB sources src/*.c)

IF (CMAKE_BUILD_TYPE STREQUAL "")
	SET(CMAKE_BUILD_TYPE "Debug")
ENDIF ()

IF (CMAKE_BUILD_TYPE STREQUAL "Debug")
	ADD_DEFINITIONS (-DDEBUG)
ENDIF ()

add_library(glutess ${sources})

add_executable(test "test/main.c")

TARGET_INCLUDE_DIRECTORIES(test PRIVATE
	"${CMAKE_CURRENT_SOURCE_DIR}/src"
)
TARGET_LINK_LIBRARIES(test
	glutess
)
