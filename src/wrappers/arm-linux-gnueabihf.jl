# Autogenerated wrapper script for SoftPosit_jll for arm-linux-gnueabihf
export softposit

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `softposit`
const softposit_splitpath = ["lib", "softposit.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
softposit_path = ""

# softposit-specific global declaration
# This will be filled out by __init__()
softposit_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const softposit = "softposit.so"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global softposit_path = abspath(joinpath(artifact"SoftPosit", softposit_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global softposit_handle = dlopen(softposit_path)
    push!(LIBPATH_list, dirname(softposit_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

