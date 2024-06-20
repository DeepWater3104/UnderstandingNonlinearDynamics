using Plots
using Distributions, Random
using LinearAlgebra

function exp_growth( x_0, a, t )
    return x_0 * exp(a*t)
end

function gen_data( x_0, a, t, td )
    data = exp_growth(x_0, a, t) + rand(td)
    if data < 0
        return gen_data(x_0, a, t, td)
    else
        return data
    end
end


μ= 0.
σ= 10
d = Normal( μ, σ)

num_data = 50
#t = rand(Uniform(0,1), num_data, 1)
#t = rand(Uniform(0,1), num_data)
t = [ i*0.02 for i in 0:num_data-1]

# initial value
x_0 = 10
a = 3.0

data = zeros(num_data)
log_data = zeros(num_data)
for i in 1:num_data
    data[i] = gen_data( x_0, a, t[i], d )
    log_data[i] = log(data[i])
end

plot(t, data, st=:scatter, label="record")
plot!(t->exp_growth(x_0, a, t), st=:line, label="ans")

Φ= ones(num_data, 2) 
Φ[:,2] = t
println(Φ)
Φ_dagger = inv(transpose(Φ)*Φ)*transpose(Φ)
(ans_ln_x, ans_a) = Φ_dagger*log_data
#println(Φ_dagger*t)
#println(ans_ln_x)
#println(ans_a)
plot!(t->exp_growth(exp(ans_ln_x), ans_a, t), xlim=(0,1.), ylim=(0, 300), label="model")
savefig("figure.png")
