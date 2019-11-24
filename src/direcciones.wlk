import aparicionesDeElementos.*
import comestibles.*
import configuracion.*
import snake.*
import wollok.game.*

object norte {

	method direccionOpuesta() = sur
	method giroDerecha() = este
	method giroIzquierda() = oeste

	method nuevaPosicion(snake) = snake.position().up(1)
	
	method imagenDeCabeza() = "Cabezas/CabezaArriba.png"
	method imagenDeCuerpo(parteDelCuerpo) {
		if(parteDelCuerpo.ultimaDireccion()==self){
			return "Cuerpos/CuerpoRecto.png"		
		}else{
			return self.imagenGiroDerecha(parteDelCuerpo)
		}
	 	
	}
	method imagenDeCola() = "Colas/ColaArriba.png"
	method imagenGiroDerecha(parteDelCuerpo) {
		if(parteDelCuerpo.ultimaDireccion()==self.giroDerecha()){
			return "Giros/Giro3.png"
		} else{
			return self.imagenGiroIzquierda()
		}
	}
	method imagenGiroIzquierda() = "Giros/Giro2.png"

}

object sur {

	method direccionOpuesta() = norte
	method giroDerecha() = oeste
	method giroIzquierda() = este

	method nuevaPosicion(snake) = snake.position().down(1)
	
	method imagenDeCabeza() = "Cabezas/CabezaAbajo.png"
	method imagenDeCuerpo(parteDelCuerpo) {
		if(parteDelCuerpo.ultimaDireccion()==self){
			return "Cuerpos/CuerpoRecto.png"
		}else{
			return self.imagenGiroDerecha(parteDelCuerpo)
		}
	} 
	method imagenDeCola() = "Colas/ColaAbajo.png"
	method imagenGiroDerecha(parteDelCuerpo) {
		if(parteDelCuerpo.ultimaDireccion()==self.giroDerecha()){
			return "Giros/Giro1.png"
		}else{
			return self.imagenGiroIzquierda()
		}
	} 
	method imagenGiroIzquierda() = "Giros/Giro4.png" 

}

object este {
	
	method direccionOpuesta() = oeste
	method giroDerecha() = sur
	method giroIzquierda() = norte

	method nuevaPosicion(snake) = snake.position().right(1)
	
	method imagenDeCabeza() = "Cabezas/CabezaDerecha.png"
	method imagenDeCuerpo(parteDelCuerpo) {
		if (parteDelCuerpo.ultimaDireccion()==self){
			return "Cuerpos/CuerpoCostado.png"
		}else{
			return self.imagenGiroDerecha(parteDelCuerpo)
		}
	} 
	method imagenDeCola() = "Colas/ColaDerecha.png"
	method imagenGiroDerecha(parteDelCuerpo) {
		if(parteDelCuerpo.ultimaDireccion()==self.giroDerecha()){
			return"Giros/Giro4.png"
		}else{
			return self.imagenGiroIzquierda()
		}
	} 
	method imagenGiroIzquierda() = "Giros/Giro3.png" 

}

object oeste {

	method direccionOpuesta() = este
	method giroDerecha() = norte
	method giroIzquierda() = sur

	method nuevaPosicion(snake) = snake.position().left(1)
	
	method imagenDeCabeza() = "Cabezas/CabezaIzquierda.png"
	method imagenDeCuerpo(parteDelCuerpo) {
		if (parteDelCuerpo.ultimaDireccion()==self){
			return "Cuerpos/CuerpoCostado.png" 
		}else {
			return self.imagenGiroDerecha(parteDelCuerpo)
		}
	} 
	method imagenDeCola() = "Colas/ColaIzquierda.png"
	method imagenGiroDerecha(parteDelCuerpo) {
		if (parteDelCuerpo.ultimaDireccion()==self.giroDerecha()){
			return"Giros/Giro2.png"
		}else{
			return self.imagenGiroIzquierda()
		}
	} 
	method imagenGiroIzquierda() = "Giros/Giro1.png" 

}


