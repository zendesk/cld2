require 'mkmf'

if !find_executable('cmake')
  abort "ERROR: CMake is required to build CLD."
end

`cmake -DCMAKE_BUILD_TYPE=Release .` unless File.exists?('Makefile')