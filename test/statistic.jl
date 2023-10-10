
@testset "unit tests" begin
    @testset "rse_sum" begin
        @test rse_sum([1, 2, 3]) == 6
        @test rse_sum([0, 0, 0]) == 0

        @test_throws AssertionError rse_sum([NaN, 3, 2])
    end

    @testset "rse_mean" begin
        @test rse_mean([1, 2, 3]) == 2
        @test rse_mean([1, 3, 6]) ≈ 3.333 atol = 1e-3

    end
end

@testset "integration test" begin
    n11 = 1
    n12 = 10
    n21 = n12 + 1
    n22 = 2n12

    data1 = collect(n11:n12)
    data2 = collect(n21:n22)

    gauss_sum1 = n12 * (n12 + 1) / 2
    gauss_sum2 = n22 * (n22 + 1) / 2 - gauss_sum1


    # Expected result
    expected_mean = (gauss_sum1 + gauss_sum2) / 2

    sum1 = rse_sum(data1)
    sum2 = rse_sum(data2)

    # Actual result
    actual_mean = rse_mean([sum1, sum2])

    # Test
    @test actual_mean == expected_mean
end
