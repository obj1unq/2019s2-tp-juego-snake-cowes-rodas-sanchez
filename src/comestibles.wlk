import wollok.game.*
import snake.*
import configuracion.*
import aparicionesDeElementos.*

object sanAntonio{
	var position=game.at(4,5)
	
	method image(){
		return "sanAntonio.png"
	}
	
	method position(){
		return position
	}
	
	method esComidoPor(unaSnake){
		unaSnake.crecer(self.crecimientoOtorgado())
		game.removeVisual(self)
		aparicionDeElementos.mostrarNuevoElemento()
		
	}
	method crecimientoOtorgado() {
		return 2
	}
	
	
	
}
