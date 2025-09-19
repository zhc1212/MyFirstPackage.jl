module MyFirstPackage

using LinearAlgebra

# Export public interfaces
export Lorenz, integrate_step
export Point, Point2D, Point3D
export RungeKutta, Euclidean

include("lorenz.jl")

end