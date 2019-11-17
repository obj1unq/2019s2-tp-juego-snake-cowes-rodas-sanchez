import wollok.game.*
import comestibles.*
import configuracion.*
import aparicionesDeElementos.*
import direcciones.*

const primerElementoDelCuerpo=new PrimerElementoDelCuerpo()

object snake {

	var property direccionDeMovimiento = norte
	var property position = game.center()
	var property image = "Cabezas/CabezaArriba.png"
	var property crecimiento = 0
	var property ultimaPosicion = game.center()
	var property cuerpo = [ primerElementoDelCuerpo ]

	method actualizarMovimiento() {
		config.controlarBordes()
		ultimaPosicion = position
		position = direccionDeMovimiento.nuevaPosicion(self)
		cuerpo.forEach{ parte => parte.actualizarMovimiento(self)}
		cola.actualizarMovimiento(self)
	}

	method crecer(cantidadDePuntos) {
		crecimiento += cantidadDePuntos
		cuerpo.add(creadorDeElemento.generarParteDelCuerpo())
	}

}

object cola {

	// La cola es necesaria ya que de esta ultima parte del cuerpo depende el agregar una nueva parte del cuerpo
	var property image = "Colas/ColaArriba.png"
	var property position = snake.cuerpo().last().ultimaPosicion()
	var property ultimaPosicion = position

	method actualizarMovimiento(unaSnake) {
		position = unaSnake.cuerpo().last().ultimaPosicion()
	}

}

class ParteDelCuerpo {

	var property image = "Cuerpos/CuerpoRecto.png"
	var property ultimaPosicion = game.at(1, 1)
	var property position = game.at(1, 1)
	const property posicionEnElCuerpo = 0

	method actualizarMovimiento(unaSnake) {
		self.posicionarEnElTablero(self.posicionDeLaParteDelCuerpoAnterior(unaSnake))
	}

	method posicionarEnElTablero(unaParteDelCuerpo) {
		ultimaPosicion = position
		position = unaParteDelCuerpo.ultimaPosicion()
	}

	method posicionDeLaParteDelCuerpoAnterior(unaSnake) {
		
		return unaSnake.cuerpo().find({ unaParte => unaParte.posicionEnElCuerpo() == self.posicionEnElCuerpo() - 1 })
	}

}

class PrimerElementoDelCuerpo inherits ParteDelCuerpo{

	// Esto es necesario para que la lista del cuerpo no sea vacia

	override method actualizarMovimiento(unaSnake) {
		ultimaPosicion = position
		position = unaSnake.ultimaPosicion()
	}

}

object creadorDeElemento {

	var property elemento

	method generarParteDelCuerpo() {
		elemento = new ParteDelCuerpo(posicionEnElCuerpo = self.crearPosicionEnElcuerpo(snake.cuerpo()), position = cola.ultimaPosicion())
		self.agregarImagen()
		return elemento
	}

	method crearPosicionEnElcuerpo(cuerpo) = cuerpo.last().posicionEnElCuerpo() + 1

	method agregarImagen() {
		game.addVisual(elemento)
	}

}

