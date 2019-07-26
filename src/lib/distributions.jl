using Random
using Distributions

function _forward(cx::Context, ::typeof(rand!), rng::AbstractRNG, sampleable::Sampleable, arr::AbstractArray)
    y, back = forward(cx, (s, xs) -> map(_ -> rand(rng, sampler(s)), xs), sampleable, arr)
    function new_back(ŷ)
        (nothing, nothing, back(ŷ)...)
    end
    y, new_back
end
  
  