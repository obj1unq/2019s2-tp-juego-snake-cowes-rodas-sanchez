import wollok.game.*
import niveles.*
import configuracion.*
import snake.*
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
		game.clear()
		game.addVisual(self)
		snake.reposicionar()
		config.configurarTeclas()
	}

}

