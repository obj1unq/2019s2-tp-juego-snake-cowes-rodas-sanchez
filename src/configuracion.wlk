import snake.*
import wollok.game.*

object config {
	method configurarTeclas() {
		keyboard.left().onPressDo({ snake.direccionDeMovimiento(snake.position().left(1))})
		keyboard.right().onPressDo({ snake.direccionDeMovimiento(snake.position().right(1))})
		keyboard.up().onPressDo({ snake.direccionDeMovimiento(snake.position().up(1))})
		keyboard.down().onPressDo({ snake.direccionDeMovimiento(snake.position().down(1))})
	}
}
