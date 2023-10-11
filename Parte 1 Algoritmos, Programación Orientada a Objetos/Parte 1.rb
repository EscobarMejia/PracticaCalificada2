def encontrar_letra_faltante(cadena)
  #Inicializamos el alfabeto
  alfabeto = 'abcdefghijklmnopqrstuvwxyz'
  # Inicializamos un contador para cada letra del alfabeto
  contador = Array.new(26, 0)

  cadena.each_char do |letra|
    if letra.match?(/[a-zA-Z]/)
      # Convierte la letra a minúscula
      letra = letra.downcase
      # Calculamos la posición en el alfabeto (0-25) usando el valor ASCII
      indice = letra.ord - 'a'.ord
      contador[indice] += 1
    end
  end

  contador.each_with_index do |count, i|
    if count.zero?
      # La letra que falta es la que tiene un contador de 0
      return ('a'.ord + i).chr
    end
  end
  # Si no falta ninguna letra, devuelve nil
  nil
end

cadena = "the quick brown box jumps over a lazy dog"
letra_faltante = encontrar_letra_faltante(cadena)
puts "La letra que falta es: #{letra_faltante}"
