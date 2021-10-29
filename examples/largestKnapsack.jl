using JuMP,Gurobi,Test, BenchmarkTools
function knapsack(; verbose = true)
    nItems = 1_000_000
    capacidad = 350_000
    v = rand(40:130, nItems)
    w = rand(50:110, nItems)
    W = capacidad # capacidad
    model = Model(Gurobi.Optimizer)
    set_optimizer_attribute(model, "OutputFlag", 0)
    @variable(model, x[1:nItems], Bin)
    @objective(model, Max, v' * x) # la transpuesta de v por la funcion objetivo
    @constraint(model, w' * x <= W)
    optimize!(model)
    if verbose
        println("El valor de la función objetivo es : ", objective_value(model))
    end
    @test termination_status(model) == MOI.OPTIMAL
    @test primal_status(model) == MOI.FEASIBLE_POINT
    return
end
@btime knapsack()
