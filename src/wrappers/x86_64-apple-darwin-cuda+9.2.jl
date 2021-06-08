# Autogenerated wrapper script for CUDA_Toolkit_jll for x86_64-apple-darwin-cuda+9.2
export libcublas, libcudadevrt, libcufft, libcupti, libcurand, libcusolver, libcusparse, libdevice, libnvtoolsext, libnvvm, nvdisasm, nvlink, ptxas

JLLWrappers.@generate_wrapper_header("CUDA_Toolkit")
JLLWrappers.@declare_library_product(libcublas, "@rpath/libcublas.9.2.dylib")
JLLWrappers.@declare_file_product(libcudadevrt)
JLLWrappers.@declare_library_product(libcufft, "@rpath/libcufft.9.2.dylib")
JLLWrappers.@declare_library_product(libcupti, "@rpath/libcupti.9.2.dylib")
JLLWrappers.@declare_library_product(libcurand, "@rpath/libcurand.9.2.dylib")
JLLWrappers.@declare_library_product(libcusolver, "@rpath/libcusolver.9.2.dylib")
JLLWrappers.@declare_library_product(libcusparse, "@rpath/libcusparse.9.2.dylib")
JLLWrappers.@declare_file_product(libdevice)
JLLWrappers.@declare_library_product(libnvtoolsext, "@rpath/libnvToolsExt.1.dylib")
JLLWrappers.@declare_library_product(libnvvm, "@rpath/libnvvm.3.2.0.dylib")
JLLWrappers.@declare_executable_product(nvdisasm)
JLLWrappers.@declare_executable_product(nvlink)
JLLWrappers.@declare_executable_product(ptxas)
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libcublas,
        "lib/libcublas.9.2.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_file_product(
        libcudadevrt,
        "lib/libcudadevrt.a",
    )

    JLLWrappers.@init_library_product(
        libcufft,
        "lib/libcufft.9.2.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libcupti,
        "lib/libcupti.9.2.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libcurand,
        "lib/libcurand.9.2.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libcusolver,
        "lib/libcusolver.9.2.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libcusparse,
        "lib/libcusparse.9.2.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_file_product(
        libdevice,
        "share/libdevice/libdevice.10.bc",
    )

    JLLWrappers.@init_library_product(
        libnvtoolsext,
        "lib/libnvToolsExt.1.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libnvvm,
        "lib/libnvvm.3.2.0.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        nvdisasm,
        "bin/nvdisasm",
    )

    JLLWrappers.@init_executable_product(
        nvlink,
        "bin/nvlink",
    )

    JLLWrappers.@init_executable_product(
        ptxas,
        "bin/ptxas",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
