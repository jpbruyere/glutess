cmake_minimum_required(VERSION 2.4)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

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

#FIND_PACKAGE(vkvg REQUIRED)
#FIND_PACKAGE(vkh REQUIRED)
FIND_PACKAGE(Vulkan REQUIRED)
FIND_PACKAGE(GLFW3 REQUIRED)

FILE(GLOB vkvgsrc testvkvg/*.c)

add_executable(vkvg ${vkvgsrc})

TARGET_INCLUDE_DIRECTORIES(vkvg PRIVATE
	"${CMAKE_CURRENT_SOURCE_DIR}/src"
	${Vulkan_INCLUDE_DIRS}
	#${VKVG_INCLUDE_DIRS}
	#${VKH_INCLUDE_DIRS}
	/mnt/devel/vkvg-master/include/
	/mnt/devel/vkvg-master/src/
	/mnt/devel/vkvg-master/vkh/src/
	/mnt/devel/vkvg-master/vkh/include/
	${GLFW3_INCLUDE_DIR}
)
TARGET_LINK_LIBRARIES(vkvg
	${Vulkan_LIBRARIES}
	#${VKVG_LIBRARIES}
	/mnt/devel/vkvg-master/build/libvkvg.so
	/mnt/devel/vkvg-master/build/vkh/libvkh.so
	#${VKH_LIBRARIES}
	${GLFW3_LIBRARY}
	m
	glutess
)


