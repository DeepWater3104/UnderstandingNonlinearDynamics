function tent(x)
    if x >= 0. && x <= 1/2.
        return 2*x
    else
        return 2-2*x
    end
end

x = 0.2
for t=0:60
    global x = tent(x)
    println(bitstring(x))
end
