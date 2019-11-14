import wollok.game.*
import comestibles.*
import configuracion.*
import aparicionesDeElementos.*
import direcciones.*

object snake {

	var property direccionDeMovimiento = norte
	var property position = game.center()
	var property image = "cabezaRandom.png"
	var property crecimiento = 0
	var property ultimaPosicion = game.center()
	var property cuerpo = [ primerElementoDelCuerpo ]

	method actualizarMovimiento() {
		config.controlarBordes()
		ultimaPosicion = position
		position = direccionDeMovimiento.nuevaPosicion(self)
		cuerpo.forEach{ parte => parte.actualizarMovimiento()}
		cola.actualizarMovimiento()
	}

	method crecer(cantidadDePuntos) {
		crecimiento += 2
		cuerpo.add(creadorDeElemento.generarParteDelCuerpo())
		cola.crecioSnake()
	}

}

object cola {

	var property image = "cuerpoColaRandom.png"
	var property position = snake.cuerpo().last().ultimaPosicion()
	var property ultimaPosicion = position

	method actualizarMovimiento() {
		position = snake.cuerpo().last().ultimaPosicion()
	}
	
	method crecioSnake(){
		position = ultimaPosicion
	}

}

class ParteDelCuerpo {

	const property image = "cuerpoColaRandom.png"
	var property ultimaPosicion = game.at(1, 1)
	var property position = game.at(1, 1)
	const property posicionEnElCuerpo = 0

	method actualizarMovimiento() {
		self. posicionarEnElTablero(snake.cuerpo().find({ unaParte => unaParte.posicionEnElCuerpo() == self.posicionEnElCuerpo() - 1}))
	}

	method posicionarEnElTablero(unaParteDelCuerpo) {
		ultimaPosicion = position
		position = unaParteDelCuerpo.ultimaPosicion()
	}

}

object primerElementoDelCuerpo {

	const property image = "cuerpoColaRandom.png"
	var property ultimaPosicion = game.center()
	var property position = game.center()
	const property posicionEnElCuerpo = 0

	method actualizarMovimiento() {
		ultimaPosicion = position
		position = snake.ultimaPosicion()
	}


}

object creadorDeElemento {

	var property elemento

	method generarParteDelCuerpo() {
		elemento = new ParteDelCuerpo(posicionEnElCuerpo = self.crearPosicionEnElcuerpo(snake.cuerpo()), position = cola.ultimaPosicion())
		self.agregarImagen()
		return elemento
	}

	method crearPosicionEnElcuerpo(cuerpo) {
		return cuerpo.last().posicionEnElCuerpo() + 1
	}

	method agregarImagen() {
		game.addVisual(elemento)
	}

}

