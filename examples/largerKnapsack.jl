using JuMP,Gurobi,Test
function knapsack(; verbose = true)
    nItems = parse(Int, ARGS[1])
    capacidad = parse(Int, ARGS[2])
    v = rand(40:130, nItems) # valores
    w = rand(50:110, nItems) # pesos
    W = capacidad # capacidad
    model = Model(Gurobi.Optimizer)
    @variable(model, x[1:nItems], Bin)
    @objective(model, Max, v' * x) # la transpuesta de v por la funcion objetivo
    @constraint(model, w' * x <= W)
    optimize!(model)
    if verbose
        println("El valor de la función objetivo es : ", objective_value(model))
        println("La solución es:")
        for i in 1:nItems
            print("x[$i] = ", value(x[i]))
            println(", v[$i]/w[$i] = ", v[i] / w[i])
        end
    end
    @test termination_status(model) == MOI.OPTIMAL
    @test primal_status(model) == MOI.FEASIBLE_POINT
    return
end
knapsack()
