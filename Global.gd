extends Node

# Variables para almacenar la puntuación protegida y su hash
var score: int = 0  # Puntuación principal
var scoreHash: String = ""  # Hash de la puntuación principal
const MAX_COINS: int = 11  # Número máximo de monedas permitidas
var precomputedHashes: Array = []

func _ready():
	# Al inicio, inicializa los valores de score, scoreHash y precalcula los hashes
	score = 0
	scoreHash = calculateScoreHash(score)
	precomputeHashes()
	print(scoreHash)

func precomputeHashes():
	# Precalcula los hashes para los valores de score de 0 a MAX_COINS
	for i in range(MAX_COINS + 1):
		precomputedHashes.append(calculateNextHash(i))
	print(precomputedHashes)

func validateScore():
	# Calcula el hash de la puntuación actual y verifica si está en los hashes precomputados
	var currentScoreHash = calculateNextHash(score)

	# Compara el hash calculado con los hashes precomputados
	if currentScoreHash not in precomputedHashes:
		# Si el hash no coincide con ninguno de los precomputados, podría indicar una manipulación
		print("¡Manipulación detectada! Puntuación revertida a 0.")
		
		# Revierte la puntuación a 0 y actualiza el hash almacenado
		score = 0
		scoreHash = calculateScoreHash(score)

func calculateScoreHash(score: int) -> String:
	# Implementa aquí la lógica para calcular un hash único
	# Incluye la puntuación y otros datos relevantes que desees proteger
	var hashscore = str(score)
	var hash = hashscore.sha256_text()
	print(hash, "<---- Hash")
	return hash  # Ejemplo usando SHA-256

func calculateNextHash(nextScore: int) -> String:
	# Implementa aquí la lógica para calcular un hash único para un score dado
	var hashscore = str(nextScore)
	var hash = hashscore.sha256_text()
	return hash  # Ejemplo usando SHA-256

func updateScore(amount: int):
	# Actualiza la puntuación solo si el cambio es válido y no excede MAX_COINS
	if score + amount <= MAX_COINS:
		score += amount
	else:
		score = MAX_COINS  # Limita la puntuación al máximo de monedas permitidas

	# Actualiza el hash de la puntuación
	scoreHash = calculateScoreHash(score)

	# Llama a la función de validación después de actualizar
	validateScore()

func _process(delta):
	# Valida el score constantemente para asegurar que no ha sido manipulado
	validateScore()

	# Verifica si score excede el límite de monedas
	if score > MAX_COINS:
		score = 0  # Resetea el score si excede el límite
		scoreHash = calculateScoreHash(score)
