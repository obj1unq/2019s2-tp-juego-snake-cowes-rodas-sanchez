import wollok.game.*
import snake.*
import configuracion.*
import aparicionesDeElementos.*

object sanAntonio{
	var property position = game.at(4,5)
	var property image = "squirrels3.png"
	
	method esComidoPor(unaSnake){
		unaSnake.crecer(self.crecimientoOtorgado())
		game.removeVisual(self)
		aparicionDeElementos.mostrarNuevoElemento()	
	}
	
	method crecimientoOtorgado() = 2
	
}


//Crear un objeto para cada una de las ardillas.