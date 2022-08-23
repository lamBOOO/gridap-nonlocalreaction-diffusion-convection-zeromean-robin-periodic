using Gridap
using GridapGmsh

# model = GmshDiscreteModel("periodic_git.msh")
# model = GmshDiscreteModel("periodic.msh")
model = GmshDiscreteModel("periodic2.msh")
# model = GmshDiscreteModel("full_periodic.msh")
u(x) = 2*x[2]
reffe = ReferenceFE(lagrangian,Float64,1)
V = TestFESpace(model,reffe,dirichlet_tags=["L","PL"])
U = TrialFESpace(V,u)
Ω = Triangulation(model)
Γ = BoundaryTriangulation(model,tags="R")
n_Γ = get_normal_vector(Γ)
dΩ = Measure(Ω,2)
dΓ = Measure(Γ,2)
a(u,v) = ∫( ∇(u)⋅∇(v) )dΩ
l(v) = ∫( n_Γ⋅(v*∇(u)) )dΓ
op = AffineFEOperator(a,l,U,V)
uh = solve(op)
writevtk(Ω,"sol",cellfields=["uh"=>uh,"u"=>u,"e"=>u-uh,"zh"=>zero(U)])
