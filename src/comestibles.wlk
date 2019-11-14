import wollok.game.*
import snake.*
import configuracion.*
import aparicionesDeElementos.*
import direcciones.*

class Comestibles {

	var property position = game.at(4, 5)
	var property image = "squirrels3.png"

	method esComidoPor(unaSnake) {
		game.removeVisual(self)
		aparicionDeElementos.mostrarNuevoElemento()
	}

	method puntosOtorgado() = 0

}

class ArdillaComun inherits Comestibles {

	override method image() = "squirrels4.png"

	override method puntosOtorgado() = 2

	override method esComidoPor(unaSnake) {
		super(unaSnake)
		unaSnake.crecer(self.puntosOtorgado())
	}

}

class ArdillaDobleCabeza inherits Comestibles {

	override method image() = "dobleArdilla.png"

	override method puntosOtorgado() = 4

}

class ArdillaDeLaMuerte inherits Comestibles {

	override method image() = "laMuerte.png"

	override method esComidoPor(unaSnake) {
		game.say(snake, "estoy Muerto")
		game.stop()
	}

}

//Crear un objeto para cada una de las ardillas. 