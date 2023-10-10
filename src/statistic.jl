function rse_sum(a)
    # s = +(a...)
    s=0
    for (i,e) in enumerate(a)
        s += e
    end

    return s
end

function rse_mean(a)
    return rse_sum(a) / length(a)
end



function rse_std(a)
    sqrt(rse_sum((a .- rse_mean(a)).^2) / (length(a)-1))
end


function rse_tstat(a;σ=rse_std(a)) 
    return rse_mean(a)/(σ/sqrt(length(a)))
end

rse_tstat(2:3,σ=2)

struct StatResult
    x; 
    n; 
    std;  
    tvalue;
end

function StatResult(a)
    std = rse_std(a)
    tvalue = rse_tstat(a)

    return StatResult(a, length(a), std, tvalue)
end



function Base.length(sr :: StatResult)
    return sr.n
end
