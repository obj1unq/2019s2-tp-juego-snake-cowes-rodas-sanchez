import wollok.game.*

object snake {
	var property direccionDeMovimiento = "Arriba" // Para empezar moviendose
	var property position = game.center()
	const property image = "player.png" // Cambiar por una viborita una vez que tengamos las imagenes

	method actualizarMovimiento() { // Faltaria agregarle los bordes al tablero
		if (direccionDeMovimiento == "Arriba") { position = position.up(1) }
		else if (direccionDeMovimiento == "Abajo") { position = position.down(1) }
		else if (direccionDeMovimiento == "Derecha") { position = position.right(1) }
		else if (direccionDeMovimiento == "Izquierda") { position = position.left(1) }
	}
}
