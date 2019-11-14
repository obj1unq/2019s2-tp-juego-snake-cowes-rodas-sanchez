import wollok.game.*
import comestibles.*
import configuracion.*
import snake.*
import direcciones.*

const ardillaComun = new ArdillaComun()
const ardillaHevy = new Ardillafiera()

object aparicionDeElementos {
	const elementosAMostrar=[ardillaComun, ardillaHevy]

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
