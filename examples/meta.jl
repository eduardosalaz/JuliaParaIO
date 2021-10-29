macro dotimes(n, cuerpo)
  quote
      for i = 1:$(esc(n))
          $(esc(cuerpo))
      end
  end
end

@dotimes 3 println("Hola mundo")

@dotimes 2 begin
  for i ∈ 1:10
    j = 1:i |> sum |> println
  end
 @info "Terminado"
end
