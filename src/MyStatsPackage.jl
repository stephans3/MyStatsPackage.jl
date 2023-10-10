module MyStatsPackage

# greet() = print("Hello World!")

export StatResult
export rse_sum, rse_mean, rse_std, rse_tstat
include("statistic.jl")


export printOwner
function printOwner()
    return "stephans3"
end

export example4pr
function example4pr()
    return "Example function for Pull Request"
end

end # module MyStatsPackage
