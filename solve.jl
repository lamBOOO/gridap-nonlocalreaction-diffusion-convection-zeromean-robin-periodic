using Gridap
using GridapGmsh
model = GmshDiscreteModel("square-with-hole-periodic.msh")

# TODO: periodic works, mine not

writevtk(model,"model")

order = 1
reffe = ReferenceFE(lagrangian,Float64,order)
V0 = TestFESpace(model,reffe;conformity=:H1)

Ug = TrialFESpace(V0,0)  # "0" is dummy, would normally hold Dirichlet BC

degree = 2
Ω = Triangulation(model)
dΩ = Measure(Ω,degree)

innertags = ["inner"]
Γ = BoundaryTriangulation(model,tags=innertags)
dΓ = Measure(Γ,degree)

reaction(u) = sum(∫( 1.0 * u ) * dΓ)
con_vel(x) = VectorValue([1,x[2]])
source(x) = 5*x[1] + 10*x[2]

a(u,v) = ∫( ∇(v)⋅∇(u) + (con_vel ⋅ ∇(u)) * v - (reaction ∘ u)*v )*dΩ
b(v) = ∫( v*source )*dΩ

op = AffineFEOperator(a,b,Ug,V0)

ls = LUSolver()
solver = LinearFESolver(ls)

uh = solve(solver,op)

writevtk(Ω,"results",cellfields=["uh"=>uh])
