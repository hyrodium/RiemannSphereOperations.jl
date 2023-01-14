"""
    ==′(z1::Number, z2::Number)

Modified version of `==` for Riemann sphere.

# Examples
```jldoctest
julia> 1 == 1.0, 1 ==′ 1.0
(true, true)

julia> 0.0 == -0.0, 0.0 ==′ -0.0
(true, true)

julia> Inf == -Inf, Inf ==′ -Inf
(false, true)

julia> NaN == NaN, NaN ==′ NaN
(false, false)

julia> complex(Inf,1) ==′ complex(-Inf,8) ==′ complex(1,Inf) ==′ complex(-Inf,-Inf)
true
```
"""
function ==′(z1, z2)
    (isnan(z1) | isnan(z2)) && return false
    (isinf(z1) & isinf(z2)) && return true
    return (z1 == z2)
end

!=′(x, y) = !(x ==′ y)

"""
    isinf′(z::Number)

Modified version of `isinf` for Riemann sphere.

# Examples
```jldoctest
julia> isinf′(42)
false

julia> isinf′(Inf)
true

julia> isinf′(complex(Inf,4))
true

julia> isinf′(complex(Inf,NaN))
false
```
"""
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
*′(x::Number, y::Number) = *′(promote(x,y)...)

function *′(z1::Complex{T}, x2::T) where {T<:Real}
    x1, y1 = reim(z1)
    x = (x1 * x2) * !iszero(x1)
    y = (y1 * x2) * !iszero(y1)
    return complex(x,y)
end
function *′(x1::T, z2::Complex{T}) where {T<:Real}
    x2, y2 = reim(z2)
    x = (x1 * x2) * !iszero(x2)
    y = (x1 * y2) * !iszero(y2)
    return complex(x,y)
end
function *′(z1::Complex{T}, z2::Complex{T}) where {T<:Real}
    ∞ = one(T)/zero(T)
    (isnan(z1) | isnan(z2)) && return z1*z2
    (isinf(z1) & isinf(z2)) && return _complex_infty_¼(_angle_inf_¼(z1)+_angle_inf_¼(z2), T)
    isinf(z1) && return _complex_finite_¼(_angle_inf_¼(z1),T) * z2 *′ ∞
    isinf(z2) && return z1 * _complex_finite_¼(_angle_inf_¼(z2),T) *′ ∞
    return z1 * z2
end

function _angle_inf_¼(z::Complex{T}) where T
    x, y = reim(z)
    if (isinf(x) & (x>0))
        (isinf(y) & (y>0)) && return 1
        (isinf(y) & (y<0)) && return 7
        return 0
    elseif (isinf(x) & (x<0))
        (isinf(y) & (y>0)) && return 3
        (isinf(y) & (y<0)) && return 5
        return 4
    else
        (y>0) && return 2
        (y<0) && return 6
    end
end

function _complex_infty_¼(i,::Type{T}) where {T<:Real}
    ∞ = one(T)/zero(T)
    𝟘 = zero(T)
    angle = mod(i,8)
    angle == 0 && return complex(∞,𝟘)
    angle == 1 && return complex(∞,∞)
    angle == 2 && return complex(𝟘,∞)
    angle == 3 && return complex(-∞,∞)
    angle == 4 && return complex(-∞,𝟘)
    angle == 5 && return complex(-∞,-∞)
    angle == 6 && return complex(𝟘,-∞)
    angle == 7 && return complex(∞,-∞)
end

function _complex_finite_¼(i,::Type{T}) where {T<:Real}
    𝟙 = one(T)
    𝟘 = zero(T)
    angle = mod(i,8)
    angle == 0 && return complex(𝟙,𝟘)
    angle == 1 && return complex(𝟙,𝟙)
    angle == 2 && return complex(𝟘,𝟙)
    angle == 3 && return complex(-𝟙,𝟙)
    angle == 4 && return complex(-𝟙,𝟘)
    angle == 5 && return complex(-𝟙,-𝟙)
    angle == 6 && return complex(𝟘,-𝟙)
    angle == 7 && return complex(𝟙,-𝟙)
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
