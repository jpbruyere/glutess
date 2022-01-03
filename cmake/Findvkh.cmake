find_path(VKH_INCLUDE_DIR vkh.h)

find_library(VKH_LIBRARY NAMES vkh)

# handle the QUIETLY and REQUIRED arguments and set VKHFOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(vkh DEFAULT_MSG
  VKH_LIBRARY  VKH_INCLUDE_DIR)

if(VKH_FOUND)
  set( VKH_LIBRARIES ${VKH_LIBRARY} )
endif()

mark_as_advanced(VKH_INCLUDE_DIR VKH_LIBRARY VKH_LIBRARIES)
