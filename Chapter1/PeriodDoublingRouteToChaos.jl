using Plots
using Printf

# code to visualize the bifurcation diagram of 
# the finite-difference equation x[t+] = R(1-x[t])x[t+1]

function update(R, x)
    x_updated = R*(1-x)*x
    return x_updated
end

R_offset = 2.5
R_step = 0.001
R_times = 2000
DT = 500
DT_offset = 200
x = Array{Float64}(undef, DT)
x_plot =  Array{Float64}(undef, 2, (DT-DT_offset)*R_times)
x_plot_num = 1;

for R_index = 1:R_times
    global R = R_index * R_step + R_offset
    x[1] = 0.5
    for t = 2:DT
        x[t] = update(R, x[t-1])
        if t > DT_offset
            x_plot[1, x_plot_num] = R
            x_plot[2, x_plot_num] = x[t] 
            global x_plot_num += 1
        end
    end
end

plot(x_plot[1,:], x_plot[2,:], st=:scatter, markersize=0.01, xlims=(2.8, 4.5))
savefig("output.png")


#f = open("output.dat", "w")
#x = Array{Float64}(undef, 1000)
#x[1] = 0.5
#R = 1.4
#for t = 2:1000
#    x[t] = update!(R, x[t-1])
#    @printf(f, "%f %f\n", t, x[t])
#end
#close(f)
