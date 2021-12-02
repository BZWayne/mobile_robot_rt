# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "second_assignment: 1 messages, 1 services")

set(MSG_I_FLAGS "-Isecond_assignment:/root/Desktop/rt_exercises/rt_ws/src/second_assignment/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(second_assignment_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/msg/Speed.msg" NAME_WE)
add_custom_target(_second_assignment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "second_assignment" "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/msg/Speed.msg" ""
)

get_filename_component(_filename "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/srv/Service.srv" NAME_WE)
add_custom_target(_second_assignment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "second_assignment" "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/srv/Service.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(second_assignment
  "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/msg/Speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/second_assignment
)

### Generating Services
_generate_srv_cpp(second_assignment
  "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/srv/Service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/second_assignment
)

### Generating Module File
_generate_module_cpp(second_assignment
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/second_assignment
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(second_assignment_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(second_assignment_generate_messages second_assignment_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/msg/Speed.msg" NAME_WE)
add_dependencies(second_assignment_generate_messages_cpp _second_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/srv/Service.srv" NAME_WE)
add_dependencies(second_assignment_generate_messages_cpp _second_assignment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(second_assignment_gencpp)
add_dependencies(second_assignment_gencpp second_assignment_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS second_assignment_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(second_assignment
  "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/msg/Speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/second_assignment
)

### Generating Services
_generate_srv_eus(second_assignment
  "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/srv/Service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/second_assignment
)

### Generating Module File
_generate_module_eus(second_assignment
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/second_assignment
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(second_assignment_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(second_assignment_generate_messages second_assignment_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/msg/Speed.msg" NAME_WE)
add_dependencies(second_assignment_generate_messages_eus _second_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/srv/Service.srv" NAME_WE)
add_dependencies(second_assignment_generate_messages_eus _second_assignment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(second_assignment_geneus)
add_dependencies(second_assignment_geneus second_assignment_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS second_assignment_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(second_assignment
  "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/msg/Speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/second_assignment
)

### Generating Services
_generate_srv_lisp(second_assignment
  "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/srv/Service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/second_assignment
)

### Generating Module File
_generate_module_lisp(second_assignment
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/second_assignment
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(second_assignment_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(second_assignment_generate_messages second_assignment_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/msg/Speed.msg" NAME_WE)
add_dependencies(second_assignment_generate_messages_lisp _second_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/srv/Service.srv" NAME_WE)
add_dependencies(second_assignment_generate_messages_lisp _second_assignment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(second_assignment_genlisp)
add_dependencies(second_assignment_genlisp second_assignment_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS second_assignment_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(second_assignment
  "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/msg/Speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/second_assignment
)

### Generating Services
_generate_srv_nodejs(second_assignment
  "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/srv/Service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/second_assignment
)

### Generating Module File
_generate_module_nodejs(second_assignment
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/second_assignment
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(second_assignment_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(second_assignment_generate_messages second_assignment_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/msg/Speed.msg" NAME_WE)
add_dependencies(second_assignment_generate_messages_nodejs _second_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/srv/Service.srv" NAME_WE)
add_dependencies(second_assignment_generate_messages_nodejs _second_assignment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(second_assignment_gennodejs)
add_dependencies(second_assignment_gennodejs second_assignment_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS second_assignment_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(second_assignment
  "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/msg/Speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/second_assignment
)

### Generating Services
_generate_srv_py(second_assignment
  "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/srv/Service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/second_assignment
)

### Generating Module File
_generate_module_py(second_assignment
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/second_assignment
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(second_assignment_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(second_assignment_generate_messages second_assignment_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/msg/Speed.msg" NAME_WE)
add_dependencies(second_assignment_generate_messages_py _second_assignment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/Desktop/rt_exercises/rt_ws/src/second_assignment/srv/Service.srv" NAME_WE)
add_dependencies(second_assignment_generate_messages_py _second_assignment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(second_assignment_genpy)
add_dependencies(second_assignment_genpy second_assignment_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS second_assignment_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/second_assignment)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/second_assignment
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(second_assignment_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(second_assignment_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/second_assignment)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/second_assignment
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(second_assignment_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(second_assignment_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/second_assignment)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/second_assignment
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(second_assignment_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(second_assignment_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/second_assignment)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/second_assignment
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(second_assignment_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(second_assignment_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/second_assignment)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/second_assignment\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/second_assignment
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(second_assignment_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(second_assignment_generate_messages_py std_msgs_generate_messages_py)
endif()
