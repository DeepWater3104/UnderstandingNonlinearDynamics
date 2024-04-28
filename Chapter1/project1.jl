using Plots

# code for the comuter project 1 at p.51

function updateA(λ, x)
    x_updated = 4*λ*x*(1-x)
    return x_updated
end

function updateB(λ, x)
    x_updated = λ*sin(π*x)
    return x_updated
end

DT = 200
xA = Array{Float64}(undef, DT)
xB = Array{Float64}(undef, DT)
λ= 0.2
xA[1] = 0.1
xB[1] = 0.1
for t = 2:DT
    xA[t] = updateA(λ,xA[t-1])
    xB[t] = updateB(λ,xB[t-1])
end

plot(xA, label="Equation A")
plot!(xB, label="Equation B")
savefig("project1.png")
