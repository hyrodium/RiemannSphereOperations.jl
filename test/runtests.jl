using RiemannSphereOperations
using Test
using Aqua

Aqua.test_all(RiemannSphereOperations)

@testset "isinf" begin
    @test !isinf(42)
    @test !isinf′(42)
    @test !isinf(NaN)
    @test !isinf′(NaN)
    @test isinf(-Inf)
    @test isinf′(-Inf)
    @test !isinf(complex(NaN,NaN))
    @test !isinf′(complex(NaN,NaN))
    @test isinf(complex(Inf,NaN))
    @test !isinf′(complex(Inf,NaN))
    @test isinf(complex(Inf,0))
    @test isinf′(complex(Inf,0))
    @test !isinf(complex(1,0))
    @test !isinf′(complex(1,0))
end

@testset "==" begin
    @test complex(Inf, Inf) ==′ complex(Inf, 0) ==′ complex(Inf, 2)
    @test complex(Inf, Inf) != complex(Inf, 0) != complex(Inf, 2)
    @test complex(1, 2) ==′ complex(1.0, 2.0) ==′ complex(1//1, 2//1)
    @test complex(1, 2) == complex(1.0, 2.0) == complex(1//1, 2//1)
end

@testset "+" begin
    @test isequal(Inf + 1, Inf)
    @test isequal(Inf +′ 1, Inf)
    @test isequal(NaN + 1, NaN)
    @test isequal(NaN +′ 1, NaN)
    @test isequal(Inf + Inf, Inf)
    @test isequal(Inf +′ Inf, NaN)
    @test isequal(-Inf + Inf, NaN)
    @test isequal(-Inf +′ Inf, NaN)
    @test isequal(1 + complex(1,2), complex(2,2))
    @test isequal(1 +′ complex(1,2), complex(2,2))
    @test isequal(1 + complex(Inf,2), complex(Inf,2))
    @test isequal(1 +′ complex(Inf,2), complex(Inf,2))
    @test isequal(Inf + complex(Inf,2), complex(Inf,2))
    @test isequal(Inf +′ complex(Inf,2), complex(NaN,2))
    @test isequal(complex(1,2) + 1, complex(2,2))
    @test isequal(complex(1,2) +′ 1, complex(2,2))
    @test isequal(complex(Inf,2) + 1, complex(Inf,2))
    @test isequal(complex(Inf,2) +′ 1, complex(Inf,2))
    @test isequal(complex(Inf,2) + Inf, complex(Inf,2))
    @test isequal(complex(Inf,2) +′ Inf, complex(NaN,2))
    @test isequal(complex(4) + complex(Inf), complex(Inf,0))
    @test isequal(complex(4) +′ complex(Inf), complex(Inf,0))
    @test isequal(complex(4,1) + complex(Inf), complex(Inf,1))
    @test isequal(complex(4,1) +′ complex(Inf), complex(Inf,1))
    @test isequal(complex(4,Inf) + complex(5,2), complex(9,Inf))
    @test isequal(complex(4,Inf) +′ complex(5,2), complex(9,Inf))
    @test isequal(complex(4,Inf) + complex(Inf,2), complex(Inf,Inf))
    @test isequal(complex(4,Inf) +′ complex(Inf,2), complex(NaN,NaN))
    @test isequal(complex(4,Inf) + complex(Inf,Inf), complex(Inf,Inf))
    @test isequal(complex(4,Inf) +′ complex(Inf,Inf), complex(NaN,NaN))
    @test isequal(complex(Inf,Inf) + complex(Inf,-Inf), complex(Inf,NaN))
    @test isequal(complex(Inf,Inf) +′ complex(Inf,-Inf), complex(NaN,NaN))
end

@testset "-" begin
    @test isequal(Inf - 1, Inf)
    @test isequal(Inf -′ 1, Inf)
    @test isequal(NaN - 1, NaN)
    @test isequal(NaN -′ 1, NaN)
    @test isequal(Inf - Inf, NaN)
    @test isequal(Inf -′ Inf, NaN)
    @test isequal(-Inf - Inf, -Inf)
    @test isequal(-Inf -′ Inf, NaN)
    @test isequal(1 - complex(1,2), complex(0,-2))
    @test isequal(1 -′ complex(1,2), complex(0,-2))
    @test isequal(1 - complex(Inf,2), complex(-Inf,-2))
    @test isequal(1 -′ complex(Inf,2), complex(-Inf,-2))
    @test isequal(Inf - complex(Inf,2), complex(NaN,-2))
    @test isequal(Inf -′ complex(Inf,2), complex(NaN,-2))
    @test isequal(complex(1,2) - 1, complex(0,2))
    @test isequal(complex(1,2) -′ 1, complex(0,2))
    @test isequal(complex(Inf,2) - 1, complex(Inf,2))
    @test isequal(complex(Inf,2) -′ 1, complex(Inf,2))
    @test isequal(complex(Inf,2) - Inf, complex(NaN,2))
    @test isequal(complex(Inf,2) -′ Inf, complex(NaN,2))
    @test isequal(complex(4) - complex(Inf), complex(-Inf,0))
    @test isequal(complex(4) -′ complex(Inf), complex(-Inf,0))
    @test isequal(complex(4,1) - complex(Inf), complex(-Inf,1))
    @test isequal(complex(4,1) -′ complex(Inf), complex(-Inf,1))
    @test isequal(complex(4,Inf) - complex(5,2), complex(-1,Inf))
    @test isequal(complex(4,Inf) -′ complex(5,2), complex(-1,Inf))
    @test isequal(complex(4,Inf) - complex(Inf,2), complex(-Inf,Inf))
    @test isequal(complex(4,Inf) -′ complex(Inf,2), complex(NaN,NaN))
    @test isequal(complex(4,Inf) - complex(Inf,Inf), complex(-Inf,NaN))
    @test isequal(complex(4,Inf) -′ complex(Inf,Inf), complex(NaN,NaN))
    @test isequal(complex(Inf,Inf) - complex(Inf,-Inf), complex(NaN,Inf))
    @test isequal(complex(Inf,Inf) -′ complex(Inf,-Inf), complex(NaN,NaN))
end

function is_almost_integer(x)
    abs(round(x) - x) < 1e-8
end

@testset "*" begin
    finites = [
        complex(1,0),
        complex(1,1),
        complex(0,1),
        complex(-1,1),
        complex(-1,0),
        complex(-1,-1),
        complex(0,-1),
        complex(1,-1),
    ]
    infinities = [
        complex(Inf,0),
        complex(Inf,Inf),
        complex(0,Inf),
        complex(-Inf,Inf),
        complex(-Inf,0),
        complex(-Inf,-Inf),
        complex(0,-Inf),
        complex(Inf,-Inf),
    ]
    @testset "($z1) *′ ($z2)" for z1 in infinities, z2 in infinities
        @test isinf′(z1 *′ z2)
        @test is_almost_integer((angle(z1)+angle(z2) - angle(z1*′z2)) / 2π)
    end
    @testset "($z1) *′ ($z2)" for z1 in finites, z2 in infinities
        @test isinf′(z1 *′ z2)
        @test isinf′(z2 *′ z1)
        @test is_almost_integer((angle(z1)+angle(z2) - angle(z1*′z2)) / 2π)
    end
    @testset "($z1) *′ ($z2)" for z1 in finites, z2 in finites
        @test z1 *′ z2 == z2 *′ z1 == z1 * z2 == z2 * z1
    end
end
