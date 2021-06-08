# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule CUDA_Toolkit_jll
using Base
using Base: UUID
using LazyArtifacts
import JLLWrappers

JLLWrappers.@generate_main_file_header("CUDA_Toolkit")

#JLLWrappers.@generate_main_file("CUDA_Toolkit", UUID("6e453f8e-2bea-4beb-930a-5f3197ca40e4"))

"""
    is_available()
Return whether the artifact is available for the current platform.
"""
function is_available end

const PATH = Ref{String}("")
const LIBPATH = Ref{String}("")
# We put these inter-JLL-package API values here so that they are always defined, even if there
# is no underlying wrapper held within this JLL package.
const PATH_list = String[]
const LIBPATH_list = String[]

# We sub off to JLLWrappers' dev_jll, but avoid backedges
dev_jll() = Base.invokelatest(JLLWrappers.dev_jll, "CUDA_Toolkit")


global best_wrapper
# Load Artifacts.toml file and select best platform at compile-time, since this is
# running at toplevel, and therefore will be run completely at compile-time.  We use
# a `let` block here to avoid storing unnecessary data in our `.ji` files
best_wrapper = let
    artifacts_toml = joinpath(@__DIR__, "..", "Artifacts.toml")
    valid_wrappers = Dict{Platform,String}()
    artifacts = load_artifacts_toml(artifacts_toml; pkg_uuid=UUID("6e453f8e-2bea-4beb-930a-5f3197ca40e4"))["CUDA_Toolkit"]

    # Helper function to parse triplets for us
    parse_wrapper_platform(x) = parse(Platform, x)
    function make_wrapper_dict(dir, x)
        return Dict(
            parse_wrapper_platform(basename(f)[1:end-3]) =>
                joinpath(dir, "wrappers", f) for f in x
        )
    end

    # If it's a Dict, that means this is an AnyPlatform artifact, act accordingly:
    if isa(artifacts, Dict)
        joinpath(@__DIR__, "wrappers", "any.jl")
    else
        # Otherwise, it's a Vector, and we must select the best platform
        # First, find all wrappers on-disk, parse their platforms, and match:
        wrapper_files = filter(x -> endswith(x, ".jl"), readdir(joinpath(@__DIR__, "wrappers")))
        wrappers = make_wrapper_dict(@__DIR__, wrapper_files)
        for e in artifacts
            platform = unpack_platform(e, "CUDA_Toolkit_jll", artifacts_toml)

            # Filter platforms based on what wrappers we've generated on-disk.
            # Because the wrapper file naming strategy relies upon BB's assumptions of triplet
            # parsing, it can be somewhat fragile.  So we have loaded all the wrapper filenames
            # in, parsed them, and are now using `select_platform()` to match them, which is
            # much more robust.  This step avoids a disconnect between what is recorded in the
            # `Artifacts.toml` file and what wrappers are available on-disk.
            wrapper_file = select_platform(wrappers, platform)
            if wrapper_file !== nothing
                valid_wrappers[platform] = wrapper_file
            end
        end

        # From the available options, choose the best wrapper script
        select_platform(valid_wrappers)
    end
end

# Load in the wrapper, if it's not `nothing`!
if best_wrapper === nothing
    @debug(string("Unable to load ", "CUDA_Toolkit", "; unsupported platform ", triplet(HostPlatform())))
    is_available() = false
else
    Base.include(CUDA_Toolkit_jll, best_wrapper)
    is_available() = true
end


end  # module CUDA_Toolkit_jll
