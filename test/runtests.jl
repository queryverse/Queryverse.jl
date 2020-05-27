using Queryverse
using Test

@testset "Queryverse" begin

    df = load(joinpath(@__DIR__, "testdata.csv")) |>
@query(i, begin
        @select {i.Count, i.Year}
    end) |>
@tee(save("testoutput.csv")) |>
# @tee(begin
#     data_values() |>
#     mark_point() |>
#     encoding_x_ord(:Year) |>
#     encoding_y_quant(:Count) |>
#     save("testoutput.pdf")
# end) |>
DataFrame

    @test size(df) == (2, 2)

    io = IOBuffer()
    f(x) = print(io, sum(x + x))
    1:10 |> @tee(f) |> x->print(io, " ", sum(x))
    @test String(take!(io)) == "110 55"

end
