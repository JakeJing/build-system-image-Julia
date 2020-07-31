## Build system image in Julia

This is used to build your own system image (including packages and scripts), so as to reduce the latency of package loading time in julia. You first need to install `PackageCompiler.jl` in julia.

```julia
pkg > add PackageCompiler
```

With the support of `PackageCompiler`, you can run the scripts (`build.jl` and `execution.jl`) in you terminal. The scripts are from this [link](https://gist.github.com/terasakisatoshi/0fe5777996598dd654df81ec9770c0e3), and you can customize the scripts and packages according to your own needs.

```Bash
>> julia --trace-compile=traced.jl -e 'using Pkg, Atom, Juno; Pkg.test("Atom"),Pkg.test("Juno")'
>> julia build.jl
```

#### 1. add sysimage for julia terminal in Atom

It will create a file called "atom.dylib", and you need to specify the path of this file inside the `additional julia startup argument` in `julia client` package settings. 

```Atom
-J/Users/jakejing/switchdrive/juliawd/sysimage-precompile/atom.dylib
```

#### 2. add sysimage for IJulia, hydrogen or jupyter notebook in Atom

In order to make IJulia or hydrogen package work with pre-compiled sysimage, you can go to the folder of jupyter kernel and append the flag of `--sysimage` in the setting.

```Bash
jupyter kernelspec list
```

Edit the `kernel.json` file for certain kernel.

```
"--sysimage=/Users/jakejing/switchdrive/juliawd/sysimage-precompile/atom.dylib",
"--project=@.",
"/Users/jakejing/.julia/packages/IJulia/DrVMH/src/kernel.jl",
"{connection_file}"
```

**Alternatively**, you can build a separate kernel with the sysimage support via IJulia, and select the right kernel once you run your script. For creating additional Julia kernels, see this [link](https://github.com/JuliaLang/IJulia.jl#Installing-additional-Julia-kernels).

```julia
julia > using IJulia
julia > installkernel("julia-sysimg", "--sysimage=/path/to/atom.dylib")
```

**Note:** one drawback for this is that the system image will always be the default version of the package, and **may overwrite the new version of the package in you project**. One solution is to **update the system image regularly**.



Related talks:

- [Shippable apps and custom sysimages with PackageCompiler.jl](https://www.youtube.com/watch?v=d7avhSuK2NA&feature=youtu.be) by Kristoffer Carlsson

- [Julia for scripting](https://www.youtube.com/watch?v=IuwxE3m0_QQ&feature=youtu.be) by Fredrik Ekre

