using Plots

x_0 = 1.
α=2.
k=1.

plot(t->x_0*exp( (k/α)*(1-exp(-α*t)) ), xlim=(0, 3), xlabel="Time [s]")
savefig("GompertzEquation.png")
