import snake.*
import wollok.game.*
import comestibles.*


object config {
	method configurarTeclas() {
		keyboard.left().onPressDo({self.controlarMovimiento(oeste)})
		keyboard.right().onPressDo({ self.controlarMovimiento(este) })
		keyboard.up().onPressDo({ self.controlarMovimiento(norte) })
		keyboard.down().onPressDo({ self.controlarMovimiento(sur) })
	}
	
	method controlarMovimiento(direccion) {
		if (snake.direccionDeMovimiento() == direccion.direccionOpuesta()) {}
			else {snake.direccionDeMovimiento(direccion)}
	}
	
	method controlarBordes() { // SIGUE PRESENTANDO PROBLEMAS AL PASAR DE UN BORDE AL OTRO, PRECISAMENTE CUANDO HAY COMIDA EN ESE EXTREMO DEL BORDE
		if (snake.position().x() > 14) { snake.position(game.at(0, snake.position().y())) }
		else if (snake.position().y() > 14) { snake.position(game.at(snake.position().x(), 0)) }
		else if (snake.position().x() < 0) { snake.position(game.at(14, snake.position().y())) }
		else if (snake.position().y() < 0) { snake.position(game.at(snake.position().x(), 14)) }
	}
}

object configurarColiciones{
	method coliciones(){
		game.onCollideDo(snake,{algo=>algo.esComidoPor(snake)})
	}
} 