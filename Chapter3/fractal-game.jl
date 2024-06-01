using Plots

function calc_midpoint( p1, p2 )
    return [ (p1[1] + p2[1])/2., (p1[2]+p2[2])/2.]
end

function toss_dice( tri, prev_mark )
    rng = rand()
    if rng < 1. / 3.
        return calc_midpoint(tri[:,1], prev_mark)
    elseif 1. / 3. <= rng && rng < 2. / 3.
        return calc_midpoint(tri[:,2], prev_mark)
    else 
        return calc_midpoint(tri[:,3], prev_mark)
    end
end


NT = 10000 # number of iteration
coordinate_tri = [ 0. 1. 0.5 0.; 0. 0. sqrt(3.)/2. 0. ]
A = Array{Float64}(undef, 2, NT)

A[:, 1] = [0.5, 0.1]
for i=2:NT
    A[:, i] = toss_dice(coordinate_tri, A[:, i-1])
end
plot(coordinate_tri[1,:], coordinate_tri[2,:], label="")
plot!(A[1,:], A[2,:], label="", st=:scatter, color=:black, markersize=0.5)

savefig("fractal-game.png")
