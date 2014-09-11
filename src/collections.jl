# TODO: Implement liblazy functions over standard arrays / other collections

walk(inner, outer, xs::Array) = @>> xs map(inner) outer

function Base.split{T}(xs::Vector{T}, x; keep = true)
  result = Vector{T}[]
  push!(result, T[])
  for i = 1:length(xs)
    if xs[i] == x
      (keep || !(isempty(result[end]) || i == length(xs))) &&
        push!(result, T[])
    else
      push!(result[end], xs[i])
    end
  end
  isempty(result[end]) && pop!(result)
  return result
end

export frequencies

function frequencies(xs)
  freqs = (eltype(xs)=>Int)[]
  for x in xs
    freqs[x] = get(freqs, x, 0) + 1
  end
  return freqs
end
