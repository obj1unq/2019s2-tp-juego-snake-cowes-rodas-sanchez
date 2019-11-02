import wollok.game.*
import comestibles.*
import configuracion.*
import snake.*

object aparicionDeElementos {
	const elementosAMostrar=[sanAntonio]

	method mostrarNuevoElemento(){
		game.addVisualIn(self.seleccionarElementoAMostrar(), self.unaPosicionAleatoria())
	}
	method seleccionarElementoAMostrar() {
		return elementosAMostrar.anyOne()
	}
	method unaPosicionAleatoria() {
		return (game.at(self.posicionX(),self.posicionY())) 
	}
	method posicionX() {
		return 0.randomUpTo(9)
	}
	method posicionY() {
		return 0.randomUpTo(9)
	}
	
}
