using Dataverse
using Base.Test

@testset "Dataverse" begin

df = load("testdata.csv") |>
@query(i, begin
@select {i.Count, i.Year}
end) |>
@sub(save("testoutput.csv")) |>
# @sub(begin
#     data_values() |>
#     mark_point() |>
#     encoding_x_ord(:Year) |>
#     encoding_y_quant(:Count) |>
#     save("testoutput.pdf")
# end) |>
DataFrame

@test size(df) == (2,2)

end