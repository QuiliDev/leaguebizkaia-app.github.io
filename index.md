# League Bizakaia
Esta es la documentación de la aplicación League Bizkaia

Entiendo lo que necesitas: quieres que mientras el jugador va adivinando, se vayan mostrando las letras correctas en sus posiciones correspondientes, pero manteniendo los guiones bajos para las letras no adivinadas. Vamos a ajustar el código para que eso funcione correctamente. 

Aquí te dejo la solución modificada:

### Código corregido:

```python
import random

# Listas de categorías y palabras por categoría
categorias = ["Profesiones", "Colores", "Animales"]
profesiones = ["INGENIERO", "DOCTOR", "ABOGADO"]
colores = ["AMARILLO", "AZUL", "ROJO"]
animales = ["ELEFANTE", "GATO", "PERRO"]

# Mostrar el menú de categorías y pedir la elección del usuario
print("Bienvenido al juego del ahorcado")
categoria_elegida = int(input("Elige una categoría: 1. Profesiones 2. Colores 3. Animales"))

# Determinar la lista de palabras según la categoría elegida
if categoria_elegida == 1:
    lista_de_palabras = profesiones
elif categoria_elegida == 2:
    lista_de_palabras = colores
elif categoria_elegida == 3:
    lista_de_palabras = animales
else:
    print("Categoría no válida. El juego se detendrá.")
    exit()

# Elegir una palabra aleatoria de la lista correspondiente
palabra_secreta = random.choice(lista_de_palabras)
longitud_palabra = len(palabra_secreta)

# Inicializar las variables para el juego
letras_adivinadas = []  # Lista para guardar las letras que el jugador adivina
intentos = 10  # Intentos iniciales

# Mostrar la categoría y la cantidad de palabras en esa categoría
print(f"La categoría elegida es: {categorias[(categoria_elegida-1)]}, y tiene {len(lista_de_palabras)} palabras.")
print("La palabra secreta tiene", longitud_palabra, "letras.")
print("El juego consiste en adivinar la palabra letra por letra, tienes 10 intentos, ¡buena suerte!")

# Bucle principal del juego
while intentos > 0:
    # Mostrar la palabra con las letras adivinadas y los guiones bajos
    palabra_mostrada = ""
    for letra in palabra_secreta:
        if letra in letras_adivinadas:
            palabra_mostrada += letra
        else:
            palabra_mostrada += "_"
    
    print("Palabra:", palabra_mostrada)
    
    # Preguntar por una letra
    letra = input("Introduce una letra: ").upper()  # Convertir a mayúscula para uniformidad

    # Verificar si la letra ya fue adivinada
    if letra in letras_adivinadas:
        print(f"Ya has adivinado la letra '{letra}'. Intenta con otra letra.")
        continue

    # Comprobar si la letra está en la palabra secreta
    if letra in palabra_secreta:
        print(f"¡Muy bien! La letra '{letra}' está en la palabra.")
        letras_adivinadas.append(letra)
    else:
        print(f"La letra '{letra}' no está en la palabra.")
        intentos -= 1
        print(f"Tienes {intentos} intentos restantes.")

    # Verificar si el jugador ha adivinado la palabra
    if all(letra in letras_adivinadas for letra in palabra_secreta):
        print(f"¡Felicidades! Has adivinado la palabra: {palabra_secreta}")
        break

if intentos == 0:
    print(f"¡Se acabaron los intentos! La palabra era: {palabra_secreta}")
```

### Cambios y detalles adicionales:
1. **Impresión dinámica de la palabra**: Cada vez que el jugador adivina una letra, se actualiza la variable `palabra_mostrada` con las letras correctas y los guiones bajos en las posiciones que aún no se han adivinado.
   
   - Usamos un bucle `for` que recorre cada letra de **`palabra_secreta`**.
   - Si la letra está en **`letras_adivinadas`**, la mostramos. Si no está, imprimimos un guion bajo (`_`).

2. **Adivinación de letras**: Cuando el jugador introduce una letra, verificamos si esa letra ya ha sido adivinada (y no se la repetirá). Si está en la palabra, se muestra en su lugar correspondiente. Si no está en la palabra, se resta un intento.

3. **Condición de victoria**: El juego termina cuando el jugador adivina todas las letras de la palabra o se queda sin intentos. Si adivina todas las letras correctamente, se muestra un mensaje de victoria.

### Ejemplo de juego:
Supongamos que la palabra secreta es **`GATO`** y el jugador ingresa las siguientes letras:

1. **Primera letra**: El jugador ingresa `G`.
   - Se muestra: `G _ _ _`
2. **Segunda letra**: El jugador ingresa `A`.
   - Se muestra: `G A _ _`
3. **Tercera letra**: El jugador ingresa `T`.
   - Se muestra: `G A T _`
4. **Cuarta letra**: El jugador ingresa `O`.
   - Se muestra: `G A T O`
   
Cuando la palabra se completa, el juego muestra que el jugador ha ganado.

### Funcionalidad:
- A medida que el jugador acierta letras, las posiciones de esas letras en la palabra se van mostrando.
- Si el jugador se queda sin intentos, el juego termina y se muestra la palabra secreta.

Espero que ahora el juego funcione tal como lo deseas. Si tienes más dudas o ajustes adicionales, no dudes en comentarlo. ¡Diviértete jugando!