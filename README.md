# Readme

Solve nonlocal reaction, diffusion, convection equation on periodic torus using zero mean constraint using `Gridap.jl`

$$
-\Delta u + \bm{a} \cdot \nabla(u) + \mathcal{R}_{\Gamma}(u) = f \quad \textnormal{ in } \Omega \\
n_\Gamma \cdot \nabla(u) + u = g \quad \textnormal{ on } \Gamma \\
\int_\Gamma u \;\textnormal{d}s = 0
$$

- $\Omega = {[0,1]}^2$ is periodic (torus)
- $\Omega$ has a hole in the middle with boundary $\Gamma$
- Linear nonlocal reaction is given by $\mathcal{R}_{\Gamma}(u) = \int_\Gamma u \; \textnormal{d}s$

## Info

- Mesh generated using `gmsh`

## TODO

- Implement zero mean, Lagrange multiplier style possible?
  - 'constraint=:zeromean' doesn't seem to work, strange..
- Implement Robin BCs
  - See https://github.com/gridap/Gridap.jl/issues/29
  - Code was removed from Gridap, try to find a working version
