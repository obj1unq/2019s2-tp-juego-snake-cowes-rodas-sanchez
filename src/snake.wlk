import wollok.game.*

object snake {
	var property direccionDeMovimiento = self.position().up(1)
	var property position = game.center()
	const property image = "player.png" // Cambiar por una viborita una vez que tengamos las imagenes
	
	method mover() {
		self.irA(direccionDeMovimiento) 
	}
	
	method irA(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
}
