using Plots

# code for the comuter project 2 at p.51

function updateA(λ, x)
    x_updated = 4*λ*x*(1-x)
    return x_updated
end

function updateB(λ, x)
    x_updated = λ*sin(π*x)
    return x_updated
end

DT = 200
DT_offset = 100
xA = Array{Float64}(undef, DT)
xB = Array{Float64}(undef, DT)
λ_step = 0.001
λ_times = 1001
xA[1] = 0.1
xB[1] = 0.1
xA_plot =  Array{Float64}(undef, 2, (DT-DT_offset)*λ_times)
xB_plot =  Array{Float64}(undef, 2, (DT-DT_offset)*λ_times)
x_plot_num = 1
for λ_index = 1:λ_times
    global λ=(λ_index-1) * λ_step
    for t = 2:DT
        xA[t] = updateA(λ,xA[t-1])
        xB[t] = updateB(λ,xB[t-1])
        if t > DT_offset
            xA_plot[1, x_plot_num] = λ
            xA_plot[2, x_plot_num] = xA[t] 
            xB_plot[1, x_plot_num] = λ
            xB_plot[2, x_plot_num] = xB[t] 
            global x_plot_num += 1
        end
    end
end

plot(xA_plot[1,:], xA_plot[2,:], st=:scatter, markersize=0.01, xlims=(0., 1.), label="")
savefig("project2_EquationA.png")

plot(xB_plot[1,:], xB_plot[2,:], st=:scatter, markersize=0.01, xlims=(0., 1.), label="")
savefig("project2_EquationB.png")
