# code for the comuter project 3 at p.52

using Plots

function update(λ, x)
    x_updated = 4*λ*x*(1-x)
end

DT = 200
DT_offset = 100
x = Array{Float64}(undef, DT)
x[1] = 0.5 #initialization
λ=0.1

#numerical calculation
for t = 2:DT
    x[t] = update(λ, x[t-1])
end

# determine if the sequence is periodic
for t = DT_offset+1:DT
    if (x[t]-x[DT_offset]) < 10^(-5)
        println("periodic")
        break;
    end
    if t == DT
        println("aperiodic")
    end
end
