import wollok.game.*
import snake.*
import configuracion.*
import aparicionesDeElementos.*
import direcciones.*

class Comestibles{
	var property position = game.at(4,5)
	var property image = "squirrels3.png"

	method esComidoPor(unaSnake){
		unaSnake.crecer(self.puntosOtorgado())
		game.removeVisual(self)
		aparicionDeElementos.mostrarNuevoElemento()	
	}
	
	method puntosOtorgado() 
}

class ArdillaComun inherits Comestibles{
	override method image() = "squirrels4.png"
	
	override method puntosOtorgado() = 2
	
}

class Ardillafiera inherits Comestibles{
	
	override method image() = "squirrels3.png"
		 
	override method puntosOtorgado() = -3
}

//Crear un objeto para cada una de las ardillas.