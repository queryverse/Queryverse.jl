@testitem "Queryverse" begin
    output_file = joinpath(mktempdir(), "testoutput.csv")

    df = load(joinpath(@__DIR__, "testdata.csv")) |>
    @query(i, begin
            @select {i.Count, i.Year}
        end) |>
    @tee(save(output_file)) |>
    DataFrame

    @test size(df) == (2, 2)
    @test isfile(output_file)

    io = IOBuffer()
    f(x) = print(io, sum(x + x))
    1:10 |> @tee(f) |> x -> print(io, " ", sum(x))
    @test String(take!(io)) == "110 55"
end
