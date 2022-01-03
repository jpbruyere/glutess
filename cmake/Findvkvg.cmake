find_path(VKVG_INCLUDE_DIR vkvg.h)

find_library(VKVG_LIBRARY NAMES vkvg)

# handle the QUIETLY and REQUIRED arguments and set VKVG_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(vkvg DEFAULT_MSG
  VKVG_LIBRARY  VKVG_INCLUDE_DIR)

if(VKVG_FOUND)
  set( VKVG_LIBRARIES ${VKVG_LIBRARY} )
endif()

mark_as_advanced(VKVG_INCLUDE_DIR VKVG_LIBRARY VKVG_LIBRARIES)
