require 'mkmf'

unless have_func("memalign") || have_func("posix_memalign")
  raise "Unsupported platform."
end

create_makefile("memory_buffer/memory_buffer");
