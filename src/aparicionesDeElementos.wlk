import wollok.game.*
import comestibles.*
import configuracion.*
import snake.*
import direcciones.*

const ardillaComun = new ArdillaComun()
const ardillaHevy = new ArdillaDobleCabeza()
const ardillaDeLaMuerte = new ArdillaDeLaMuerte()
const ardillaMataMuerte = new ArdillaMataArdillasMuertas()

object aparicionDeElementos {
	var property ancho=0
	var property alto=0
	const elementosAMostrar = [ ardillaComun, ardillaHevy, ardillaDeLaMuerte, ardillaMataMuerte ]

	method mostrarNuevoElemento() {
		self.seleccionarElementoAMostrar().mostrateYActuaEn(self.unaPosicionAleatoria())
	}

	method seleccionarElementoAMostrar() = elementosAMostrar.anyOne()

	method unaPosicionAleatoria() = game.at(self.posicionX(), self.posicionY())

	method posicionX() = 0.randomUpTo(ancho)
    method posicionY() = 0.randomUpTo(alto)

	method dimensionDelTablero(unAncho,unaAltura) {
		ancho=unAncho
		alto=unaAltura
	}
}

