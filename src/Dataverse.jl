module Dataverse

using Reexport

@reexport using DataValues
@reexport using DataValueArrays
@reexport using IterableTables
@reexport using Query
@reexport using DataFrames
@reexport using FileIO
@reexport using ExcelFiles
@reexport using StatFiles
@reexport using CSVFiles
# @reexport using FeatherFiles
@reexport using VegaLite

export vlplot

export @sub

macro sub(x)
    quote
        x -> begin
            x |> $(x)
            return x
        end
    end
end

const vlplot = VegaLite.data_values

end # module
