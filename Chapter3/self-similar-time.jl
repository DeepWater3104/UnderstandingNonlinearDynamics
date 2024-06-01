using FFTW
using Plots

function update(x)
    temp = x + x^2
    x_updated = (temp >= 1.) ? temp - 1 : temp
end

NT = 10000
f = Array{Float64}(undef, NT)
f[1] = 0.5
for i=2:NT
    f[i] = update(f[i-1])
end

f2 = zeros(nextpow(2, length(f)))
f2[1:length(f)] = f
F2 = abs.(fft(f2)) / length(f2)
F2 = F2 .^ 2
F3 = F2[1 : Int(length(F2)/2)+1]
F3[2:end-1] = F3[2:end-1] * 2.
freq = range(0., 1/2., length=length(F3))
time = range(0., NT-1, step=1)


p1 = plot(time, f, xlabel="Time[s]", label="")
p2 = plot(freq, F3, xscale=:log2, yscale=:log2, xlabel="Frequency[Hz]", ylabel="Power", label="", xlim=(0.001, 0.5))
#p2 = plot(freq, F3)
plot(p1, p2, layout=(2,1))
savefig("self-similar-time.png")
