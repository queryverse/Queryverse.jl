using Documenter, Queryverse

makedocs(
	modules = [Queryverse],
	sitename = "Queryverse.jl",
	analytics="UA-132838790-1",
	pages = [
        "Introduction" => "index.md"
    ]
)

deploydocs(
    repo = "github.com/queryverse/Queryverse.jl.git"
)
