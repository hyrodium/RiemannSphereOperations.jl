## TODO: add +′, *′ etc.

function ==′(z1, z2)
    (isnan(z1) | isnan(z2)) && return false
    (isinf(z1) & isinf(z2)) && return true
    return (z1 == z2)
end

!=′(x, y) = !(x ==′ y)

function isinf′(z::Complex)
    return isinf(z) & !isnan(z)
end
function isinf′(x::Real)
    return isinf(x)
end

nan(x::Number) = zero(x)/zero(x)
inf(::Type{Complex{T}}) where {T} = Complex{T}(inf(T),inf(T))
inf(T::Type{<:Real}) = one(T)/zero(T)
inf(::T) where T = inf(T)

# +′
function +′(x1::Real, z2::Complex)
    x2, y2 = reim(z2)
    x = x1 +′ x2
    return complex(x,y2)
end
function +′(z1::Complex, x2::Real)
    x1, y1 = reim(z1)
    x = x1 +′ x2
    return complex(x,y1)
end
function +′(z1::Number, z2::Number)
    (isnan(z1) | isnan(z2)) && return z1+z2
    (isinf(z1) & isinf(z2)) && return nan(z1+z2)
    return z1 + z2
end

# -′
function -′(x1::Real, z2::Complex)
    x2, y2 = reim(z2)
    x = x1 -′ x2
    return complex(x,-y2)
end
function -′(z1::Complex, x2::Real)
    x1, y1 = reim(z1)
    x = x1 -′ x2
    return complex(x,y1)
end
function -′(z1::Number, z2::Number)
    (isnan(z1) | isnan(z2)) && return z1-z2
    (isinf(z1) & isinf(z2)) && return nan(z1-z2)
    return z1 - z2
end

# *′
function *′(z1::Number, z2::Number)
    (isnan(z1) | isnan(z2)) && return z1*z2
    (isinf(z1) | isinf(z2)) && return inf(z1*z2)
    return z1 * z2
end

## inv′
function inv′(z::Complex)
    c, d = reim(z)
    (isinf(c) | isinf(d)) && return complex(copysign(zero(c), c), flipsign(-zero(d), d))
    (iszero(c) & iszero(d)) && return complex(copysign(1/zero(c), c), flipsign(-1/zero(d), d))
    return complex(c, -d)/(c * c + d * d)
end
inv′(z::Complex{<:Integer}) = inv′(float(z))
inv′(x::Real) = inv(x)

## /′
/′(x::Number, y::Number) = /′(promote(x,y)...)
/′(x::Real, y::Real) = x / y
/′(a::R, z::S) where {R<:Real,S<:Complex} = (T = promote_type(R,S); a*inv′(T(z)))
/′(z::Complex, x::Real) = z/complex(x)
function /′(z::Complex{T}, w::Complex{T}) where T
    # TODO: reprecate Base method
    return z*inv′(w)
end

## \′
\′(x,y) = adjoint(adjoint(y)/′adjoint(x))
