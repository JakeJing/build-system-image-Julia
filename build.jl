using PackageCompiler
PackageCompiler.create_sysimage(
    [:Atom,:Juno,:Plots,:Turing,:MCMCChains,:Distributions,:StatsPlots,:StatsFuns], # you may add OhMyREPL, Revise and so on
    precompile_statements_file=["traced.jl"],
    precompile_execution_file=["execution.jl"],
    sysimage_path="atom.dylib",
)
