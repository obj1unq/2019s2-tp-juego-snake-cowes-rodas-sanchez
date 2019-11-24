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

	var property ancho = 0
	var property alto = 0
	const elementosAMostrar = [ ardillaComun, ardillaHevy, ardillaDeLaMuerte, ardillaMataMuerte ]

	method mostrarNuevoElemento() {
		self.seleccionarElementoAMostrar().mostrateYActuaEn(self.unaPosicionAleatoria())
	}

	method seleccionarElementoAMostrar() {
		return elementosAMostrar.anyOne()
	}

	method unaPosicionAleatoria() {
		var x = 0.randomUpTo(ancho)
		var y = 0.randomUpTo(alto)
		if (game.getObjectsIn(game.at(x, y)).isEmpty()) {
			return (game.at(x, y))
		} else {
			return self.unaPosicionAleatoria()
		}
	}

	method dimensionDelTablero(unAncho, unaAltura) {
		ancho = unAncho
		alto = unaAltura
	}

}

