using Aqua
using Documenter
using GraphsBase
using JET
using JuliaFormatter
using Test

DocMeta.setdocmeta!(GraphsBase, :DocTestSetup, :(using GraphsBase); recursive=true)

@testset verbose = true "GraphsBase.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(GraphsBase; deps_compat=(; check_extras=false,))
    end
    @testset "Formatting (JuliaFormatter.jl)" begin
        @test format(GraphsBase; verbose=false, overwrite=false)
    end
    doctest(GraphsBase)
    @testset "Static checking (JET.jl)" begin
        JET.test_package(GraphsBase; target_modules=(GraphsBase,))
    end
    # Put the actual tests here
end
