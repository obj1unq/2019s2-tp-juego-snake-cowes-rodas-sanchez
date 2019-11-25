import wollok.game.*
import configuracion.*
import snake.*
import comestibles.*
import inicio.*
import aparicionesDeElementos.*

object nivel1 {

	method iniciar(){
	game.clear()
	// CONFIG	
	game.title("Snake")
	config.configurarTablero(10,10)
	game.ground("ground.png")
	config.configurarTeclas()
	game.onTick(500, "Movimiento del Snake", {
	snake.actualizarMovimiento()
	})

	//  VISUALES
 	game.addVisual(snake)
 	game.addVisual(primerElementoDelCuerpo)
 	game.addVisual(cola)
 	game.addVisual(ardillaComun)
 	

 	//  COMIENZA
	configurarColiciones.coliciones()
	game.start()
	
	}
	
}
