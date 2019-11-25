import wollok.game.*
import snake.*
import configuracion.*
import aparicionesDeElementos.*
import direcciones.*
import ardillasPeligrosas.*
import inicio.*
import niveles.*

class Comestibles {

	var property position = game.at(4, 5)
	var property image = ""

	method esComidoPor(unaSnake) {
		unaSnake.sumarPuntos(self.puntosOtorgado())
		game.removeVisual(self)
		aparicionDeElementos.mostrarNuevoElemento()
	}

	method puntosOtorgado() = 0
	
	method mostrateYActuaEn(unaPosicion) {
		game.addVisualIn(self, unaPosicion)
	}

}

class ArdillaComun inherits Comestibles {

	override method image() = "Ardillas/ardillaComun.png"

	override method puntosOtorgado() = 1

	override method esComidoPor(unaSnake) {
		super(unaSnake)
		unaSnake.crecer()
	}

}

class ArdillaDobleCabeza inherits Comestibles {
	

	override method image() = "Ardillas/ardillaDobleCabeza.png"
	
	override method esComidoPor(unaSnake){
		super(unaSnake)
		unaSnake.crecer()
		unaSnake.crecer()
	}

	override method puntosOtorgado() = 2

}

class ArdillaDeLaMuerte inherits Comestibles {
	override method image() = "Ardillas/laMuerte.png"

	override method esComidoPor(unaSnake) {
		pantallaDeInicio.nuevoInicio()
		
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
	
	override method mostrateYActuaEn(unaPosicion) {
		if (ardillasPeligrosas.conjuntoDeArdillas().isEmpty()) {
		    aparicionDeElementos.mostrarNuevoElemento()
		} else {
			super(unaPosicion)
		}
	}
	
	override method esComidoPor(unaSnake){
		ardillasPeligrosas.eliminarAAlguien()
		super(unaSnake)
	}
	
	
}

