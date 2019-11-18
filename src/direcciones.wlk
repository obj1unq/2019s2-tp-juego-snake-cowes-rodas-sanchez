import aparicionesDeElementos.*
import comestibles.*
import configuracion.*
import snake.*
import wollok.game.*

object norte {

	const property direccionOpuesta = sur

	method nuevaPosicion(snake) = snake.position().up(1)
	method imagenDeCabeza() = "Cabezas/CabezaArriba.png"
	method imagenDeCuerpo() = "Cuerpos/CuerpoRecto.png"
	method imagenDeCola() = "Colas/ColaArriba.png"

}

object sur {

	const property direccionOpuesta = norte

	method nuevaPosicion(snake) = snake.position().down(1)
	method imagenDeCabeza() = "Cabezas/CabezaAbajo.png"
	method imagenDeCuerpo() = "Cuerpos/CuerpoRecto.png"
	method imagenDeCola() = "Colas/ColaAbajo.png"

}

object este {

	const property direccionOpuesta = oeste

	method nuevaPosicion(snake) = snake.position().right(1)
	method imagenDeCabeza() = "Cabezas/CabezaDerecha.png"
	method imagenDeCuerpo() = "Cuerpos/CuerpoCostado.png"
	method imagenDeCola() = "Colas/ColaDerecha.png"

}

object oeste {

	const property direccionOpuesta = este

	method nuevaPosicion(snake) = snake.position().left(1)
	method imagenDeCabeza() = "Cabezas/CabezaIzquierda.png"
	method imagenDeCuerpo() = "Cuerpos/CuerpoCostado.png"
	method imagenDeCola() = "Colas/ColaIzquierda.png"

}

