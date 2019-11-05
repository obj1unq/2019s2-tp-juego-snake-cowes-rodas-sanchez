import snake.*
import wollok.game.*
import comestibles.*


object config {
	method configurarTeclas() {
		keyboard.left().onPressDo({ 
			snake.direccionDeMovimiento("Izquierda")
		})
		keyboard.right().onPressDo({ snake.direccionDeMovimiento("Derecha") })
		keyboard.up().onPressDo({ snake.direccionDeMovimiento("Arriba") })
		keyboard.down().onPressDo({ snake.direccionDeMovimiento("Abajo") })
	}
	

}

object configurarColiciones{
	method coliciones(){
		game.onCollideDo(snake,{algo=>algo.esComidoPor(snake)})
	}
}