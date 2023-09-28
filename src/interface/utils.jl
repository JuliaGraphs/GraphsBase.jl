"""
    check_comparable_interface(T)

Check that objects of type `T` can be hashed and compared.

This is true if the following methods are implemented:

- `Base.hash(t::T, h::UInt)`
- `Base.isless(t1::T, t2::T)`
- `Base.:(==)(t1::T, t2::T)`
"""
function check_comparable_interface(::Type{T}) where {T}
    if !hasmethod(Base.hash, (T, UInt))
        @warn "Missing method `Base.hash(::$T, ::UInt)`"
        return false
    elseif !hasmethod(Base.isless, (T, T))
        @warn "Missing method `Base.isless(::$T, ::$T)`"
        return false
    elseif !hasmethod(Base.:(==), (T, T))
        @warn "Missing method `Base.:(==)(::$T, ::$T)`"
        return false
    else
        return true
    end
end
