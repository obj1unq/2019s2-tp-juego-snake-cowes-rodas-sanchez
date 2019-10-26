import snake.*
import wollok.game.*

object config {
	method configurarTeclas() {
		keyboard.left().onPressDo({ snake.direccionDeMovimiento("Izquierda") })
		keyboard.right().onPressDo({ snake.direccionDeMovimiento("Derecha") })
		keyboard.up().onPressDo({ snake.direccionDeMovimiento("Arriba") })
		keyboard.down().onPressDo({ snake.direccionDeMovimiento("Abajo") })
	}
}