# Install script for directory: /home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/src/boris_manipulator

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/boris_manipulator/srv" TYPE FILE FILES
    "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/src/boris_manipulator/srv/localization.srv"
    "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/src/boris_manipulator/srv/control.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/boris_manipulator/cmake" TYPE FILE FILES "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/build/boris_manipulator/catkin_generated/installspace/boris_manipulator-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/devel/include/boris_manipulator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/devel/share/roseus/ros/boris_manipulator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/devel/share/common-lisp/ros/boris_manipulator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/devel/share/gennodejs/ros/boris_manipulator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/devel/lib/python3/dist-packages/boris_manipulator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/devel/lib/python3/dist-packages/boris_manipulator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/build/boris_manipulator/catkin_generated/installspace/boris_manipulator.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/boris_manipulator/cmake" TYPE FILE FILES "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/build/boris_manipulator/catkin_generated/installspace/boris_manipulator-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/boris_manipulator/cmake" TYPE FILE FILES
    "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/build/boris_manipulator/catkin_generated/installspace/boris_manipulatorConfig.cmake"
    "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/build/boris_manipulator/catkin_generated/installspace/boris_manipulatorConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/boris_manipulator" TYPE FILE FILES "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/src/boris_manipulator/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/boris_manipulator" TYPE PROGRAM FILES "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/build/boris_manipulator/catkin_generated/installspace/server.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/boris_manipulator" TYPE PROGRAM FILES "/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/build/boris_manipulator/catkin_generated/installspace/client.py")
endif()

