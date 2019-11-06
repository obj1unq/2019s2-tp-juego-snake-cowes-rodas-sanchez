import wollok.game.*
import comestibles.*
import configuracion.*
import aparicionesDeElementos.*

object snake {
	var property direccionDeMovimiento = "Arriba" // Para empezar moviendose
	var property position = game.center()
	var property image = "cabeza2.png" // Cambiar por una viborita una vez que tengamos las imagenes
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
	var property image="sanAntonio.png"

	var property position = primerElementoDelCuerpo.ultimaPosicion()	
	
	method actualizarMovimiento(){
		position = primerElementoDelCuerpo.ultimaPosicion()
	}
}

object partesDelCuerpo {
	var property partes=[primerElementoDelCuerpo]
	
	method crecer(){
		partes.add (new PartesDelCuerpo(position=partes.last().ultimaPosicion()))
	}
	
	method actualizarMovimiento(){
		partes.foreach({parte => parte.actualizar()})
	}
	
}

object primerElementoDelCuerpo{
	const property image="cabeza2.png"
	var property ultimaPosicion=game.center()

	var property position = snake.ultimaPosicion()	
	
	method actualizarMovimiento(){
		ultimaPosicion=position
		position = snake.ultimaPosicion()
		
	}
	
}

class PartesDelCuerpo {
	var property image="SnakeCabeza.png"
	var property ultimaPosicion = game.center()
	var property position = game.center()
	
	method actualizar(elementoAnterior){
		ultimaPosicion=position
		position = elementoAnterior.ultimaPosicion()
	}
}

