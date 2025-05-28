# Install script for directory: /home/sid/repos/flameshot/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
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

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/flameshot" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/flameshot")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/flameshot"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/sid/repos/flameshot/src/flameshot")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/flameshot" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/flameshot")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/flameshot"
         OLD_RPATH "/home/sid/anaconda3/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/flameshot")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share" TYPE DIRECTORY FILES "/home/sid/repos/flameshot/src/share/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/flameshot/translations" TYPE FILE FILES
    "/home/sid/repos/flameshot/src/Internationalization_bg.qm"
    "/home/sid/repos/flameshot/src/Internationalization_ca.qm"
    "/home/sid/repos/flameshot/src/Internationalization_cs.qm"
    "/home/sid/repos/flameshot/src/Internationalization_de_DE.qm"
    "/home/sid/repos/flameshot/src/Internationalization_el.qm"
    "/home/sid/repos/flameshot/src/Internationalization_en.qm"
    "/home/sid/repos/flameshot/src/Internationalization_es.qm"
    "/home/sid/repos/flameshot/src/Internationalization_eu.qm"
    "/home/sid/repos/flameshot/src/Internationalization_fa.qm"
    "/home/sid/repos/flameshot/src/Internationalization_fi.qm"
    "/home/sid/repos/flameshot/src/Internationalization_fr.qm"
    "/home/sid/repos/flameshot/src/Internationalization_gl.qm"
    "/home/sid/repos/flameshot/src/Internationalization_grc.qm"
    "/home/sid/repos/flameshot/src/Internationalization_he.qm"
    "/home/sid/repos/flameshot/src/Internationalization_hu.qm"
    "/home/sid/repos/flameshot/src/Internationalization_id.qm"
    "/home/sid/repos/flameshot/src/Internationalization_it_IT.qm"
    "/home/sid/repos/flameshot/src/Internationalization_ja.qm"
    "/home/sid/repos/flameshot/src/Internationalization_ka.qm"
    "/home/sid/repos/flameshot/src/Internationalization_ko.qm"
    "/home/sid/repos/flameshot/src/Internationalization_nb_NO.qm"
    "/home/sid/repos/flameshot/src/Internationalization_nl_NL.qm"
    "/home/sid/repos/flameshot/src/Internationalization_nl.qm"
    "/home/sid/repos/flameshot/src/Internationalization_pl.qm"
    "/home/sid/repos/flameshot/src/Internationalization_pt_BR.qm"
    "/home/sid/repos/flameshot/src/Internationalization_ru.qm"
    "/home/sid/repos/flameshot/src/Internationalization_sk.qm"
    "/home/sid/repos/flameshot/src/Internationalization_sr_SP.qm"
    "/home/sid/repos/flameshot/src/Internationalization_sv_SE.qm"
    "/home/sid/repos/flameshot/src/Internationalization_tr.qm"
    "/home/sid/repos/flameshot/src/Internationalization_uk.qm"
    "/home/sid/repos/flameshot/src/Internationalization_vi.qm"
    "/home/sid/repos/flameshot/src/Internationalization_zh_CN.qm"
    "/home/sid/repos/flameshot/src/Internationalization_zh_HK.qm"
    "/home/sid/repos/flameshot/src/Internationalization_zh_TW.qm"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sid/repos/flameshot/src/cli/cmake_install.cmake")
  include("/home/sid/repos/flameshot/src/config/cmake_install.cmake")
  include("/home/sid/repos/flameshot/src/core/cmake_install.cmake")
  include("/home/sid/repos/flameshot/src/utils/cmake_install.cmake")
  include("/home/sid/repos/flameshot/src/widgets/cmake_install.cmake")
  include("/home/sid/repos/flameshot/src/tools/cmake_install.cmake")

endif()

