using Oceananigans
using GLMakie
using Oceananigans.Models.HydrostaticFreeSurfaceModels: PrescribedVelocityFields

Nx = Ny = 128
Lx = Ly = 2π

grid = RectilinearGrid(size=(Nx, Ny), x=(0, Lx), y=(0, Ly), topology=(Bounded, Bounded, Flat))

ψ = Field(Face, Face, Center, CPU(), grid)

ψ_kolmogorov(x, y, z) = sin(x) * sin(y)
set!(ψ, ψ_kolmogorov)

u = XFaceField(CPU(), grid)
v = YFaceField(CPU(), grid)

u .= + ∂y(ψ)
v .= - ∂x(ψ)

velocities = PrescribedVelocityFields(u=u, v=v)
closure = IsotropicDiffusivity(κ=1e-4)
tracer_advection = WENO5()

model = HydrostaticFreeSurfaceModel(; grid, velocities, closure, tracer_advection, tracers=:c, buoyancy=nothing)

cᵢ(x, y, z) = cos(x)
set!(model, c=cᵢ)

simulation = Simulation(model, Δt=1e-3, stop_time=4)

c = model.tracers.c
initial_c = Array(interior(c)[:, :, 1])

run!(simulation)

final_c = Array(interior(c)[:, :, 1])

fig = Figure(resolution=(1200, 900))

ax_i = Axis(fig[1, 1])
heatmap!(ax_i, initial_c)

ax_f = Axis(fig[1, 2])
heatmap!(ax_f, final_c)

display(fig)
