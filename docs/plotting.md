# Plotting

There exist different visualization alternatives for SpaceEx results. Here we present these alternatives and an illustrative example. 

## Bash script

This solution is needs the tools: `graph` and `pdftoppm` added to your path. Also `spaceex` should be accessible from your path. The script works by transforming the SpaceEx result to PDF and to PNG formats. 

Link: [plot_gen.sh](https://github.com/JuliaReach/ReachabilityBenchmarks/blob/master/models/SLICOT/iss/spaceex.sh). 

Written by Christian Schilling. 

## `plot_vertices.m` (Matlab)




## `3PLIB` (Java)

The project [3PLIB](https://3plib.wordpress.com/) is a Java Library developed
by Frédéric Viry. This library is specialized to planar projections of convex polyhedra. It was initially created to embed this feature in Java applications, and also provides a backend for visualization of high-dimensional reach set approximations computed with [SpaceEx](http://spaceex.imag.fr/).

## `LazySets.jl` (Julia)


`LazySets.jl` is part of the [JuliaReach](https://github.com/juliareach), an online organisation for reachability computations for dynamical systems in [Julia](https://julialang.org/), a modern high-performance language for scientific computing.

This is the more feature-rich plotting solution, since there are many plotting backends available.

![assets/plot_plotly.png](assets/plot_plotly.png)


## `plot_vertices.py` (Python)

