import wollok.game.*
import niveles.* 
import configuracion.*

object pantallaDeInicio {
	var property position = game.origin()
	var property image = "InicioSnakeFINALchico.png"
	
	method inicio(){
		//  CONFIG	
	game.addVisual(self)
	game.start()
	}
}
