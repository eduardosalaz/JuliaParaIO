abstract type Animal end
struct Lagarto <: Animal nom :: String end
struct Conejo <: Animal nom :: String end

carrera(l::Lagarto, c::Conejo) = "$(l.nom) nada más rápido"
carrera(c::Conejo, l::Lagarto) = "$(r.nom) corre más rápido"
carrera(a::T, b::T) where T <: Animal = "$(a.nom) y $(b.nom) se duermen"

function encontrar(a::Animal, b::Animal)
  println("$(a.nom) se encuentra a $(b.nom) y hacen una carrera")
  println("Resultado: $(carrera(a,b))")
end

godz = Lagarto("Godzilla")
tamb = Conejo("Tambor")
encontrar(godz, tamb)
encontrar(tamb, godz)
encontrar(godz, godz)
