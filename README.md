# UnknownFlows.jl

We're making a game where players guess the ultimate location of trash, plastic, carbon or any ocean surface tracer transported by the ocean surface circulation.
This game uses

- [Oceananigans.jl](https://github.com/CliMA/Oceananigans.jl)
- [Makie.jl](https://github.com/JuliaPlots/Makie.jl) (perhaps hosting via `WGLMakie.jl`)

Todo:

- [ ] Integration of particle trajectories with prescribed flow fields (Greg, see)
- [ ] Particle trajectories in complex domains / with immersed boundaries (Greg)
- [ ] Obtain realistic ocean circulation on a staggered C-grid
- [ ] Prescribe "cyclic" / seasonally varying surface circulation in Oceanagnians via `PrescribedVelocityFields`
- [ ] "On-the-fly" insertion of particles into an ongoing simulation via `Callback` (Simone)
- [ ] Interactive GUI permitting particle insertion "with a click" with either [GLUT.jl](https://github.com/SimonDanisch/GLUT.jl) or Makie (Simone)
- [ ] "On-the-fly" updating of tracer sources / sinks (by updating `Array` tracer forcing in a `Callback`)
