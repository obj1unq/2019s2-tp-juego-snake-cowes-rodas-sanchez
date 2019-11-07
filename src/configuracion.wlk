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
}

object configurarColiciones{
	method coliciones(){
		game.onCollideDo(snake,{algo=>algo.esComidoPor(snake)})
	}
}