# Videojuego coin collector - Clase 7 - Godot

# Todo lo referido a un sistema anticheats se encuentra en la carpeta "Global.gd"

## Demostracion por yt:
### https://www.youtube.com/watch?v=FYONumSKJwc

## Introducción
### Este proyecto implementa un sistema para proteger la puntuación del jugador en juegos contra manipulaciones externas utilizando hashes SHA-256. El objetivo es mantener la integridad del juego al asegurar que la puntuación no sea alterada de manera fraudulenta.

# Funcionamiento del Sistema
## Inicialización
### Al inicio del juego, se establece la puntuación inicial y se calcula su hash. También se precalculan los hashes para todas las puntuaciones válidas, desde 0 hasta el valor máximo permitido (MAX_COINS).

## Validación de Puntuación
### En cada iteración del juego, se verifica si el hash de la puntuación actual coincide con uno de los hashes precalculados. Si no coincide, se considera que la puntuación ha sido manipulada y se resetea a 0.

## Actualización de Puntuación
### Para actualizar la puntuación del jugador, se verifica que el cambio sea válido y no exceda MAX_COINS. Se actualiza el hash de la puntuación y se valida su integridad.

## Proceso Continuo
### En cada ciclo del juego, se valida continuamente la puntuación para detectar manipulaciones y se asegura de que no se exceda el límite de monedas permitidas.

## Conclusión
### Este sistema simple de detección de trampas utiliza hashes SHA-256 para intentar proteger la lo que logre hackear es el numero limite de MaxCoins y los coins, tambien descibri como modificar variables "String" y la cosa es, creo que encontre una forma de pasar el hash que seria con lo que descubri crear un script que se ejecute antes de que cargue todo y modificar los maxcoins para que cree los hashes que quiera, pero no llegue a descubrir como lograr crear un script

## Como hackearlo
### lo que logre hackear es el numero limite de MaxCoins y los coins, tambien descibri como modificar variables "String" y la cosa es, creo que encontre una forma de pasar el hash que seria con lo que descubri crear un script que se ejecute antes de que cargue todo y modificar los maxcoins para que cree los hashes que quiera, pero no llegue a descubrir como lograr crear un script
