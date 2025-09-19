using CairoMakie
using MyFirstPackage: Lorenz, integrate_step, RungeKutta
import MyFirstPackage
set_theme!(theme_black())

# Initialize system
lz = Lorenz(10, 28, 8/3)
y = MyFirstPackage.Point(1.0, 1.0, 1.0)
 
points = Observable(Point3f[])
colors = Observable(Int[])

# Create visualization
fig, ax, l = lines(points, color = colors,
    colormap = :inferno, transparency = true, 
    axis = (; type = Axis3, protrusions = (0, 0, 0, 0), 
              viewmode = :fit, limits = (-30, 30, -30, 30, 0, 50)))

# Generate animation
 let
     y = MyFirstPackage.Point(1.0, 1.0, 1.0)
    record(fig, "lorenz.mp4", 1:120) do frame
        for i in 1:50
            y = integrate_step(lz, RungeKutta{4}(), y, 0.01)
            push!(points[], Point3f(y...))
            push!(colors[], frame)
        end
        ax.azimuth[] = 1.7pi + 0.3 * sin(2pi * frame / 120)
        notify(points); notify(colors)
        l.colorrange = (0, frame)
    end
end
