import wollok.game.*
import comestibles.*
import configuracion.*
import aparicionesDeElementos.*

object snake {
	var property direccionDeMovimiento = norte
	var property position = game.center()
	var property image = "cabezaRandom.png"
	var property crecimiento = 0
	var property ultimaPosicion = game.center()

	method actualizarMovimiento() {
		    config.controlarBordes()
			ultimaPosicion = position
			position = direccionDeMovimiento.nuevaPosicion(self)
	}		
	
	method crecer(cantidadDePuntos){
		crecimiento += 2
	}
}

object cola{
	var property image="cuerpoColaRandom.png"
    var property position = primerElementoDelCuerpo.ultimaPosicion()	
	
	method actualizarMovimiento(){
		position = primerElementoDelCuerpo.ultimaPosicion()
	}
}

object primerElementoDelCuerpo{
	const property image = "cuerpoColaRandom.png"
	var property ultimaPosicion= game.center()
	var property position = snake.ultimaPosicion()	
	
	method actualizarMovimiento(){
		ultimaPosicion = position
		position = snake.ultimaPosicion()
	}
}

object norte {
	const property direccionOpuesta = sur
	
	method nuevaPosicion(snake) = snake.position().up(1)
}

object sur {
	const property direccionOpuesta = norte
	
	method nuevaPosicion(snake) = snake.position().down(1)
}

object este {
	const property direccionOpuesta = oeste
	
	method nuevaPosicion(snake) = snake.position().right(1)
}

object oeste {
	const property direccionOpuesta = este
	
	method nuevaPosicion(snake) = snake.position().left(1)
}