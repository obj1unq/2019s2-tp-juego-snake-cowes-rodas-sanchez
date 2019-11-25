import wollok.game.*
import niveles.*
import configuracion.*

object pantallaDeInicio {

	var property position = game.origin()
	var property image = "InicioSnakeFINALchico.png"

	method inicio() {
		// CONFIG	
		game.width(15)
		game.height(15)
		game.title("Snake")
		game.addVisual(self)
		config.configurarTeclas()
		game.start()
	}

	method nuevoInicio() {
		nivel1.alto()
		game.addVisual(self)
		config.configurarTeclas()
	}

}

