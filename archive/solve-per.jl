
# model = GmshDiscreteModel("periodic_git.msh")
model = GmshDiscreteModel("periodic.msh")
# model = GmshDiscreteModel("periodic-hole.msh")
# model = GmshDiscreteModel("Mesh2-v2.msh")
# model = GmshDiscreteModel("Mesh2-v4.msh")

# domain = (0, 1, 0, 1)
# partition = (10,10)
# model = CartesianDiscreteModel(domain, partition; isperiodic=(true, true))  # quads

u(x) = x[1]+2*x[2]
# u(x) = 2*x[1]+x[2]
# u(x) = sin(2*pi*x[1]/2)^2 + sin(2*pi*x[2]/2)^2
reffe = ReferenceFE(lagrangian,Float64,1)
V = TestFESpace(model,reffe)
# V = TestFESpace(model,reffe,dirichlet_tags=["PL"])
# V = TestFESpace(model,reffe,dirichlet_tags=["PL"])
U = TrialFESpace(V,0)
Ω = Triangulation(model)
# Γ = BoundaryTriangulation(model,tags="inner")
Γ = BoundaryTriangulation(model)
n_Γ = get_normal_vector(Γ)
dΩ = Measure(Ω,2)
dΓ = Measure(Γ,2)
reaction(u) = sum(∫( 1.0 * u ) * dΓ)
a(u,v) = ∫( ∇(u)⋅∇(v) - (reaction ∘ u)*v + u*v)dΩ
# l(v) = ∫( n_Γ⋅(v*∇(u)) )dΓ
l(v) = ∫( u * v )dΩ
op = AffineFEOperator(a,l,U,V)
uh = solve(op)
writevtk(Ω,"sol",cellfields=["uh"=>uh,"u"=>u,"e"=>u-uh,"zh"=>zero(U)])

sum( ∫(abs2(u - uh))dΩ ) < 1.0e-9
