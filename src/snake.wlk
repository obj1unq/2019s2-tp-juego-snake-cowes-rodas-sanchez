import wollok.game.*
import comestibles.*
import configuracion.*
import aparicionesDeElementos.*

object snake {
	var property direccionDeMovimiento = norte
	var property position = game.center()
	var property image = "cabezaFalopa.png"
	var property crecimiento = 0
	var property ultimaPosicion = game.center()

	method actualizarMovimiento() {
		    self.controlarBordes()
			ultimaPosicion = position
			position = direccionDeMovimiento.nuevaPosicion(self)
	}		
	
	method crecer(cantidadDePuntos){
		crecimiento += 2
	}
	
	method controlarBordes() {
		if (position.x() == 9) { position = game.at(0, position.y()) }
		else if (position.y() == 9) { position = game.at(position.x(), 0) }
		else if (position.x() == 0) { position = game.at(9, position.y()) }
		else if (position.y() == 0) { position = game.at(position.x(), 9) }
	}
}

object cola{
	var property image="cuerpoColaFalopa.png"
    var property position = primerElementoDelCuerpo.ultimaPosicion()	
	
	method actualizarMovimiento(){
		position = primerElementoDelCuerpo.ultimaPosicion()
	}
}

object primerElementoDelCuerpo{
	const property image = "cuerpoColaFalopa.png"
	var property ultimaPosicion= game.center()
	var property position = snake.ultimaPosicion()	
	
	method actualizarMovimiento(){
		ultimaPosicion = position
		position = snake.ultimaPosicion()
	}
}

object norte {
	//const direccionOpuesta = sur
	
	method nuevaPosicion(snake) = snake.position().up(1)
}

object sur {
	//const direccionOpuesta = norte
	
	method nuevaPosicion(snake) = snake.position().down(1)
}

object este {
	//const direccionOpuesta = oeste
	
	method nuevaPosicion(snake) = snake.position().right(1)
}

object oeste {
	//const direccionOpuesta = este
	
	method nuevaPosicion(snake) = snake.position().left(1)
}