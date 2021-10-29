using JuMP,Gurobi,Test
function knapsack(; verbose = true)
    # maximizar Σi=1:n vᵢxᵢ
    # s.a. Σi=1:n wᵢxᵢ ≤ W, xᵢ ∈ {0,1}
    v = [5, 3, 2, 7, 4] # valores
    w = [2, 8, 4, 2, 5] # pesos
    W = 10 # capacidad
    model = Model(Gurobi.Optimizer)
    @variable(model, x[1:5], Bin)
    @objective(model, Max, v' * x) # la transpuesta de v por la funcion objetivo
    @constraint(model, w' * x <= W)
    optimize!(model)
    if verbose
        println("El valor de la función objetivo es : ", objective_value(model))
        println("La solución es:")
        for i in 1:5
            print("x[$i] = ", value(x[i]))
            println(", v[$i]/w[$i] = ", v[i] / w[i])
        end
    end
    @test termination_status(model) == MOI.OPTIMAL
    @test primal_status(model) == MOI.FEASIBLE_POINT
    @test objective_value(model) == 16.0
    return
end
knapsack()
