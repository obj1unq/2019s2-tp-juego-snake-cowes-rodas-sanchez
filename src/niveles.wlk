import wollok.game.*
import configuracion.*
import snake.*
import comestibles.*
import inicio.*
import aparicionesDeElementos.*

object nivel1 {

	method iniciar(){
	game.removeVisual(pantallaDeInicio)
	// CONFIG	
	game.title("Snake")
	config.configurarTablero(15,15)
	game.ground("ground.png")
	game.onTick(100, "Movimiento del Snake", {
	snake.actualizarMovimiento()
	})

	//  VISUALES
 	game.addVisual(snake)
 	game.addVisual(primerElementoDelCuerpo)
 	game.addVisual(cola)
 	game.addVisual(ardillaComun)
 	

 	//  COMIENZA
	configurarColiciones.coliciones()
	}
	
	
	
}
