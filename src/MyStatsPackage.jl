module MyStatsPackage

# greet() = print("Hello World!")

export StatResult
export rse_sum, rse_mean, rse_std, rse_tstat
include("statistic.jl")

end # module MyStatsPackage
