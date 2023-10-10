module MyStatsPackage

# greet() = print("Hello World!")

export StatResult
export rse_sum, rse_mean, rse_std, rse_tstat
include("statistic.jl")


export printOwner
function printOwner()
    return "Stephan Scholz"
end

end # module MyStatsPackage
