import wollok.game.*
import comestibles.*
import configuracion.*
import aparicionesDeElementos.*
import direcciones.*

const primerElementoDelCuerpo=new PrimerElementoDelCuerpo()

object snake {

	var property direccionDeMovimiento = norte
	var property ultimaDireccion = norte
	var property position = game.center()
	var property crecimiento = 0
	var property ultimaPosicion = game.center()
	var property cuerpo = [ primerElementoDelCuerpo ]

    method image() = direccionDeMovimiento.imagenDeCabeza()
    
	method actualizarMovimiento() {
		config.controlarBordes()
		ultimaPosicion = position
		ultimaDireccion = direccionDeMovimiento
		position = direccionDeMovimiento.nuevaPosicion(self)
		cuerpo.forEach{ parte => parte.actualizarMovimiento(self)}
		cola.actualizarMovimiento(self)
	}

	method crecer(cantidadDePuntos) {
		crecimiento += cantidadDePuntos
		cuerpo.add(creadorDeElemento.generarParteDelCuerpo())
	}
	
	method esComidoPor(unaSnake) {
		game.stop()
	}
	
	method girarAl(unaDireccion) {
		
	}
}

object cola {

	// La cola es necesaria ya que de esta ultima parte del cuerpo depende el agregar una nueva parte del cuerpo
	var property direccionDeMovimiento = norte
	var property position = snake.cuerpo().last().ultimaPosicion()
	var property ultimaPosicion = position

    method image() = direccionDeMovimiento.imagenDeCola()
	method actualizarMovimiento(unaSnake) {
		const ultimaParteDelCuerpo = unaSnake.cuerpo().last()
		position = ultimaParteDelCuerpo.ultimaPosicion()
		direccionDeMovimiento = ultimaParteDelCuerpo.ultimaDireccion()
	}
	
	method esComidoPor(unaSnake){
		game.stop()
	}

}

class ParteDelCuerpo {
	
	var property direccionDeMovimiento = norte
	var property ultimaDireccion = norte
	var property ultimaPosicion = game.at(-1, -1) // Si se inicia dentro del tablero aparece por un milisegundo la imagen, por eso es mejor que inicie por fuera 
	var property position = game.at(-1, -1)
	const property posicionEnElCuerpo = 0

    method image() = direccionDeMovimiento.imagenDeCuerpo()
	
	method actualizarMovimiento(unaSnake) {
		self.posicionarEnElTablero(self.posicionDeLaParteDelCuerpoAnterior(unaSnake))
		self.actualizarDireccion(self.posicionDeLaParteDelCuerpoAnterior(unaSnake))
	}

	method posicionarEnElTablero(unaParteDelCuerpo) {
		ultimaPosicion = position
		position = unaParteDelCuerpo.ultimaPosicion()
	}
	
	method actualizarDireccion(unaParteDelCuerpo) {
		ultimaDireccion = direccionDeMovimiento
		direccionDeMovimiento = unaParteDelCuerpo.ultimaDireccion()
	}

	method posicionDeLaParteDelCuerpoAnterior(unaSnake) =
	 unaSnake.cuerpo().find({ unaParte => unaParte.posicionEnElCuerpo() == posicionEnElCuerpo - 1 })

	method esComidoPor(unaSnake){
		game.stop()
	}
}

class PrimerElementoDelCuerpo inherits ParteDelCuerpo{

	// Esto es necesario para que la lista del cuerpo no sea vacia

	override method actualizarMovimiento(unaSnake) {
		ultimaPosicion = position
		position = unaSnake.ultimaPosicion()
		self.actualizarDireccion(unaSnake)
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

