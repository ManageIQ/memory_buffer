require 'mkmf'

have_func("memalign")
have_func("posix_memalign")
have_func("_aligned_malloc")

create_makefile("memory_buffer/memory_buffer");
