import wollok.game.*
import comestibles.*
import configuracion.*
import aparicionesDeElementos.*
import direcciones.*
import inicio.*

const primerElementoDelCuerpo=new PrimerElementoDelCuerpo()

object snake {

	var property direccionDeMovimiento = norte
	var property ultimaDireccion = norte
	var property position = game.center()
	var property puntos = 0
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

	method sumarPuntos(cantidadDePuntos) {
		puntos += cantidadDePuntos
		game.say(self,"tengo: "+self.puntos()+" puntos")
	}
	
	method crecer(){
		cuerpo.add(creadorDeElemento.generarParteDelCuerpo())
	}
	
	method girarAl(unaDireccion) {
		
	}
	
	method reposicionar (){
		position = game.center()
		puntos=0
		cuerpo.forEach({parte => cuerpo.remove(parte)})
		cuerpo.add(primerElementoDelCuerpo)
		cola.reposicionar()
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
		pantallaDeInicio.nuevoInicio()
	}
	
	method reposicionar(){
		position = snake.cuerpo().last().ultimaPosicion()
	}

}

class ParteDelCuerpo {
	
	var property direccionDeMovimiento = norte
	var property ultimaDireccion = norte
	var property ultimaPosicion = game.at(-1, -1) // Si se inicia dentro del tablero aparece por un milisegundo la imagen, por eso es mejor que inicie por fuera 
	var property position = game.at(-1, -1)
	const property posicionEnElCuerpo = 0

    method image() = direccionDeMovimiento.imagenDeCuerpo(self)
	
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
		pantallaDeInicio.nuevoInicio()
	}
	
	method reposicionar(){
		position = game.at(-1, -1)
		
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

