import aparicionesDeElementos.*
import comestibles.*
import configuracion.*
import snake.*
import wollok.game.*

object norte {
	const property direccionOpuesta = sur
	
	method nuevaPosicion(snake) = snake.position().up(1)
}

object sur {
	const property direccionOpuesta = norte
	
	method nuevaPosicion(snake) = snake.position().down(1)
}

object este {
	const property direccionOpuesta = oeste
	
	method nuevaPosicion(snake) = snake.position().right(1)
}

object oeste {
	const property direccionOpuesta = este
	
	method nuevaPosicion(snake) = snake.position().left(1)
}
