module Queryverse

using Reexport

@reexport using DataValues
import IterableTables
@reexport using Query
@reexport using DataFrames
@reexport using FileIO
@reexport using ExcelFiles
@reexport using StatFiles
@reexport using CSVFiles
@reexport using FeatherFiles
@reexport using ParquetFiles
@reexport using VegaLite
@reexport using DataVoyager

export DV

export @tee

macro tee(x)
    quote
        x -> begin
            x |> $(x)
            return x
        end
    end
end

const DV = DataValues.DataValue

end # module
