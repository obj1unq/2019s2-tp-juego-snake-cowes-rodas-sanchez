import wollok.game.*
import snake.*
import configuracion.*
import aparicionesDeElementos.*
import direcciones.*
import ardillasPeligrosas.*

class Comestibles {

	var property position = game.at(4, 5)
	var property image = ""
	var property esLaMuerte=false
	

	method esComidoPor(unaSnake) {
		game.removeVisual(self)
		aparicionDeElementos.mostrarNuevoElemento()
	}

	method puntosOtorgado() = 0
	
	method mostrateYActuaEn(unaPosicion) {
		// game.getObjectsIn(unaPosicion) podria funcionar para evitar que aparezcan dos objetos en la misma posicion?
		game.addVisualIn(self, unaPosicion)
	}

}

class ArdillaComun inherits Comestibles {

	override method image() = "Ardillas/ardillaComun.png"

	override method puntosOtorgado() = 2

	override method esComidoPor(unaSnake) {
		super(unaSnake)
		unaSnake.crecer(self.puntosOtorgado())
	}

}

class ArdillaDobleCabeza inherits Comestibles {
	

	override method image() = "Ardillas/ardillaDobleCabeza.png"

	override method puntosOtorgado() = 4

}

class ArdillaDeLaMuerte inherits Comestibles {
	

	override method image() = "Ardillas/laMuerte.png"

	override method esComidoPor(unaSnake) {
		game.say(snake, "estoy Muerto")
		game.stop()
	}

	override method mostrateYActuaEn(unaPosicion){
		var nuevaArdilla = new ArdillaDeLaMuerte()
		game.addVisualIn(nuevaArdilla,unaPosicion)
		ardillasPeligrosas.agregarArdillaPeligrosa(nuevaArdilla)
		aparicionDeElementos.mostrarNuevoElemento()
		
	}
	
	method fuisteEliminado(){
		game.removeVisual(self)
	}
}

class ArdillaMataArdillasMuertas inherits Comestibles{
	override method image(){
		return "Ardillas/ardillaMataArdillasMuertas.png"
	}
	
	override method esComidoPor(unaSnake){
		ardillasPeligrosas.eliminarAAlguien()
		super(unaSnake)
	}
	
	
}

