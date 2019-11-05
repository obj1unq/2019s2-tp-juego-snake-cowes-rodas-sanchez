import wollok.game.*
import comestibles.*
import configuracion.*
import aparicionesDeElementos.*

object snake {
	var property direccionDeMovimiento = "Arriba" // Para empezar moviendose
	var property position = game.center()
	const property image = "SnakeCabeza.png" // Cambiar por una viborita una vez que tengamos las imagenes
	var property crecimiento=0
	var property ultimaPosicion=game.center()

	method actualizarMovimiento() { // Faltaria agregarle los bordes al tablero
		if (direccionDeMovimiento == "Arriba") { 
			ultimaPosicion=position
			position = position.up(1)
			
		}
		else if (direccionDeMovimiento == "Abajo") { 
			ultimaPosicion=position
			position = position.down(1)
		}
		else if (direccionDeMovimiento == "Derecha") { 
			ultimaPosicion=position
			position = position.right(1)
		}
		else if (direccionDeMovimiento == "Izquierda") { 
			ultimaPosicion=position
			position = position.left(1)
		}
	}
	
	method crecer(cantidadDePuntos){
		crecimiento += 2
	}
}

object cola{
	const property image="sanAntonio.png"

	var property position = snake.ultimaPosicion()	
	
	method actualizarMovimiento(){
		position = snake.ultimaPosicion()
	}
}


