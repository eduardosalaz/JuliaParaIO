using Dates

function saludar(f::Function)::Nothing
  nombre = f()
  println("Buenos días $nombre, hoy es $(today())")
end

function aleatorio()
  nombres = ["Beatriz", "Citlali", "Diana", "Neto", "Rodolfo", "Roger", "Uriel"]
  nombre = nombres[rand(1:end)]
  return nombre
end

for x ∈ 1:3
  saludar(aleatorio)
end
