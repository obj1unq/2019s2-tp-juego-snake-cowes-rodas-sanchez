import snake.*
import wollok.game.*
import comestibles.*


object config {
	method configurarTeclas() {
		keyboard.left().onPressDo({ snake.direccionDeMovimiento(oeste) })
		keyboard.right().onPressDo({ snake.direccionDeMovimiento(este) })
		keyboard.up().onPressDo({ snake.direccionDeMovimiento(norte) })
		keyboard.down().onPressDo({ snake.direccionDeMovimiento(sur) })
	}
}

object configurarColiciones{
	method coliciones(){
		game.onCollideDo(snake,{algo=>algo.esComidoPor(snake)})
	}
}