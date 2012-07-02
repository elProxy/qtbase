
macro(expect_pass _dir)
  string(REPLACE "(" "_" testname "${_dir}")
  string(REPLACE ")" "_" testname "${testname}")
  add_test(${testname} ${CMAKE_CTEST_COMMAND}
    --build-and-test
    "${CMAKE_CURRENT_SOURCE_DIR}/${_dir}"
    "${CMAKE_CURRENT_BINARY_DIR}/${_dir}"
    --build-generator ${CMAKE_GENERATOR}
    --build-makeprogram ${CMAKE_MAKE_PROGRAM}
    --build-options "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}" "-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}"
  )
endmacro()

macro(expect_fail _dir)
  string(REPLACE "(" "_" testname "${_dir}")
  string(REPLACE ")" "_" testname "${testname}")
  file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/failbuild/${_dir}")
  file(COPY "${CMAKE_CURRENT_SOURCE_DIR}/${_dir}" DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/failbuild/${_dir}")
  file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/failbuild/${_dir}/CMakeLists.txt"
    "
      cmake_minimum_required(VERSION 2.8)
      project(${_dir}_build)

      try_compile(Result \${CMAKE_CURRENT_BINARY_DIR}/${_dir}
          \${CMAKE_CURRENT_SOURCE_DIR}/${_dir}
          ${_dir}
          OUTPUT_VARIABLE Out
      )
      message(\"\${Out}\")
      if (Result)
        message(SEND_ERROR \"Succeeded build which should fail\")
      endif()
      "
  )
  add_test(${testname} ${CMAKE_CTEST_COMMAND}
    --build-and-test
    "${CMAKE_CURRENT_BINARY_DIR}/failbuild/${_dir}"
    "${CMAKE_CURRENT_BINARY_DIR}/failbuild/${_dir}/build"
    --build-generator ${CMAKE_GENERATOR}
    --build-makeprogram ${CMAKE_MAKE_PROGRAM}
    --build-options "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}" "-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}"
  )
endmacro()