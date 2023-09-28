using GraphsBase: check_comparable_interface
using Test

@test check_comparable_interface(Int)
@test check_comparable_interface(Symbol)
@test check_comparable_interface(String)
@test !check_comparable_interface(Any)
