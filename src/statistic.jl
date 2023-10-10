function rse_sum(a::AbstractVector)
    # s = +(a...)
    @assert all(!isnan, a)

    s = 0
    for (i, e) in enumerate(a)
        s += e
    end

    return s
end

function rse_mean(a::AbstractVector)
    return rse_sum(a) / length(a)
end



function rse_std(a::AbstractVector)
    sqrt(rse_sum((a .- rse_mean(a)) .^ 2) / (length(a) - 1))
end


function rse_tstat(a::AbstractVector; σ = rse_std(a))
    return rse_mean(a) / (σ / sqrt(length(a)))
end

struct StatResult
    x::Any
    n::Any
    std::Any
    tvalue::Any
end

function StatResult(a::AbstractVector)
    std = rse_std(a)
    tvalue = rse_tstat(a)

    return StatResult(a, length(a), std, tvalue)
end



function Base.length(sr::StatResult)
    return sr.n
end
