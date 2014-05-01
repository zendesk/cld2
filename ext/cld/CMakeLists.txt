project(CLD2)

cmake_minimum_required (VERSION 2.6)

set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build, options are: Debug, Release" FORCE)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/build")

if(UNIX)
  SET(CMAKE_C_FLAGS_RELEASE "-O3")
  SET(CMAKE_CXX_FLAGS_RELEASE "-O3")
endif(UNIX)

include_directories("internal/")

set(CLD2_SRCS
  "internal/cldutil.cc"
  "internal/cldutil_shared.cc"
  "internal/compact_lang_det.cc"
  "internal/compact_lang_det_hint_code.cc"
  "internal/compact_lang_det_impl.cc"
  "internal/debug.cc"
  "internal/fixunicodevalue.cc"
  "internal/generated_entities.cc"
  "internal/generated_language.cc"
  "internal/generated_ulscript.cc"
  "internal/getonescriptspan.cc"
  "internal/lang_script.cc"
  "internal/offsetmap.cc"
  "internal/scoreonescriptspan.cc"
  "internal/tote.cc"
  "internal/utf8statetable.cc"
  "internal/cld_generated_cjk_uni_prop_80.cc"
  "internal/cld2_generated_cjk_compatible.cc"
  "internal/cld_generated_cjk_delta_bi_4.cc"
  "internal/generated_distinct_bi_0.cc"
  "internal/cld2_generated_quadchrome0122_2.cc"
  "internal/cld2_generated_deltaoctachrome0122.cc"
  "internal/cld2_generated_distinctoctachrome0122.cc"
  "internal/cld_generated_score_quad_octa_0122_2.cc"
  "thunk.cc")

add_library(cld2 MODULE ${CLD2_SRCS})

install(TARGETS cld2 DESTINATION "${PROJECT_BINARY_DIR}/lib")