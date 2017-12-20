module Dataverse

using Reexport

@reexport using DataValues
@reexport using IterableTables
@reexport using Query
@reexport using DataFrames
@reexport using FileIO
@reexport using ExcelFiles
@reexport using StatFiles
@reexport using CSVFiles
@reexport using FeatherFiles
# @reexport using VegaLite

export vlplot, DV

export @tee

macro tee(x)
    quote
        x -> begin
            x |> $(x)
            return x
        end
    end
end

# const vlplot = VegaLite.data_values
const DV = DataValues.DataValue

end # module
