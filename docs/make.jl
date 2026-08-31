using Documenter, Queryverse

makedocs(
	modules=[Queryverse],
	sitename="Queryverse.jl",
	format = Documenter.HTML(analytics = "UA-132838790-1"),
	warnonly = [:missing_docs],
	pages=[
        "Introduction" => "index.md"
    ]
)

deploydocs(
    repo="github.com/queryverse/Queryverse.jl.git"
)
