function(find_soname_libs libraries_list output_var)
    foreach(lib ${libraries_list})
        execute_process(COMMAND objdump -p ${lib} COMMAND grep SONAME COMMAND xargs echo -n OUTPUT_VARIABLE soname_lib)
        string(REPLACE "SONAME " "" soname_lib "${soname_lib}")
        find_library(${lib}_soname_path NAMES ${soname_lib})
        set(libs_path ${libs_path} ${${lib}_soname_path})
    endforeach()
    set(${output_var} ${libs_path} PARENT_SCOPE)
endfunction()
