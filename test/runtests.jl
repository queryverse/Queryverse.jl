using Queryverse
using Base.Test

@testset "Queryverse" begin

df = load("testdata.csv") |>
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

@test size(df) == (2,2)

end