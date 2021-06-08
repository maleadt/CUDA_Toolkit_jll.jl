# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule CUDA_Toolkit_jll
using Base
using Base: UUID
using LazyArtifacts
import JLLWrappers

JLLWrappers.@generate_main_file_header("CUDA_Toolkit")
JLLWrappers.@generate_main_file("CUDA_Toolkit", UUID("6e453f8e-2bea-4beb-930a-5f3197ca40e4"))
end  # module CUDA_Toolkit_jll
