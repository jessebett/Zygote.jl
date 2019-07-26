using Random

function f(a,b)
    rng = MersenneTwister(1234)
    dist = Normal(a,b)
    return sum(rand(rng, dist, 4))
end
@test gradient(f, 1, 2) = 1234

@test Zygote.forward(d->rand(MersenneTwister(123456), d, 4), Normal(0.0, 1.0))


# Yet to implement:
#     uni_dists = [
#         Arcsine(2, 4),
#         Beta(2,2),
#         BetaPrime(),
#         Biweight(),
#         Cauchy(),
#         Chi(3),
#         Chisq(2),
#         Cosine(),
#         Epanechnikov(),
#         Erlang(),
#         Exponential(),
#         FDist(1, 1),
#         Frechet(),
#         Gamma(),
#         InverseGamma(),
#         InverseGaussian(),
#         # Kolmogorov(),
#         Laplace(),
#         Levy(),
#         Logistic(),
#         LogNormal(1.0, 2.5),
#         Normal(0.1, 2.5),
#         Pareto(),
#         Rayleigh(1.0),
#         TDist(2),
#         TruncatedNormal(0, 1, -Inf, 2),
#     ]
