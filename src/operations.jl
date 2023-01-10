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
