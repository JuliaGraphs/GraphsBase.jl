using Aqua
using Documenter
using GraphsBase
using JET
using JuliaFormatter
using Test

DocMeta.setdocmeta!(GraphsBase, :DocTestSetup, :(using GraphsBase); recursive=true)

@testset verbose = true "GraphsBase.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(GraphsBase)
    end
    @testset "Formatting (JuliaFormatter.jl)" begin
        @test format(GraphsBase; verbose=false, overwrite=false)
    end
    @testset "Doctests (Documenter.jl)" begin
        doctest(GraphsBase)
    end
    @testset "Static checking (JET.jl)" begin
        if VERSION >= v"1.9"
            JET.test_package(GraphsBase; target_modules=(GraphsBase,))
        end
    end
    @testset "Interface" begin
        @testset "Utils" begin
            include("interface/utils.jl")
        end
        @testset "AbstractEdge" begin
            include("interface/abstractedge.jl")
        end
        @testset "AbstractGraph" begin
            include("interface/abstractgraph.jl")
        end
    end
    @testset "SimpleGraphs" begin
        include("SimpleGraphs/SimpleGraphs.jl")
    end
    @testset "SimpleWeightedGraphs" begin
        include("SimpleWeightedGraphs/SimpleWeightedGraphs.jl")
    end
end
