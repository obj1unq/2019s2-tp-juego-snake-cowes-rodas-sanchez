import snake.*
import wollok.game.*
import comestibles.*
import direcciones.*
import aparicionesDeElementos.*
import inicio.*
import niveles.*

object config {

	var alto = 0
	var ancho = 0

	method configurarTeclas() {
		keyboard.left().onPressDo({ self.controlarMovimiento(oeste)})
		keyboard.right().onPressDo({ self.controlarMovimiento(este)})
		keyboard.up().onPressDo({ self.controlarMovimiento(norte)})
		keyboard.down().onPressDo({ self.controlarMovimiento(sur)})
		keyboard.q().onPressDo({game.stop()})
		keyboard.enter().onPressDo({nivel1.iniciar()})
	}

	method controlarMovimiento(direccion) {
		if (snake.direccionDeMovimiento() == direccion.direccionOpuesta()) {
		} else {
			snake.direccionDeMovimiento(direccion)
		}
	}

	method controlarBordes() { // SIGUE PRESENTANDO PROBLEMAS AL PASAR DE UN BORDE AL OTRO, PRECISAMENTE CUANDO HAY COMIDA EN ESE EXTREMO DEL BORDE
		if (snake.position().x() > ancho - 1) {
			snake.position(game.at(0, snake.position().y()))
		} else if (snake.position().y() > alto - 1) {
			snake.position(game.at(snake.position().x(), 0))
		} else if (snake.position().x() < 0) {
			snake.position(game.at(ancho - 1, snake.position().y()))
		} else if (snake.position().y() < 0) {
			snake.position(game.at(snake.position().x(), alto - 1))
		}
	}

	method configurarTablero(unAncho, unaAltura) {
		game.width(unAncho)
		game.height(unaAltura)
		aparicionDeElementos.dimensionDelTablero(unAncho, unaAltura)
		self.dimensionesDelTablero(unAncho, unaAltura)
	}

	method dimensionesDelTablero(unAncho, unaAltura) {
		alto = unaAltura
		ancho = unAncho
	}

}

object configurarColiciones {

	method coliciones() {
		game.onCollideDo(snake, { algo => algo.esComidoPor(snake)})
	}

}

