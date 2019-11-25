import aparicionesDeElementos.*
import comestibles.*
import configuracion.*
import snake.*
import wollok.game.*

object norte {
	var property giro
	method direccionOpuesta() = sur
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
		if(parteDelCuerpo.ultimaDireccion()==self.giro()){
			return "Giros/AbajoADerecha.png"
		} else{
			return self.imagenGiroIzquierda()
		}
	}
	method imagenGiroIzquierda() = "Giros/AbajoAIzquierda.png"

}

object sur {
	var property giro
	method direccionOpuesta() = norte


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
		if(parteDelCuerpo.ultimaDireccion()==self.giro()){
			return "Giros/ArribaADerecha.png"
		}else{
			return self.imagenGiroIzquierda()
		}
	} 
	method imagenGiroIzquierda() = "Giros/ArribaAIzquierda.png" 

}

object este {
	var property giro
	method direccionOpuesta() = oeste
	

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
		if(parteDelCuerpo.ultimaDireccion()==self.giro()){
			return"Giros/ArribaAIzquierda.png"
		}else{
			return self.imagenGiroIzquierda()
		}
	} 
	method imagenGiroIzquierda() = "Giros/AbajoAIzquierda.png" 

}

object oeste {
	var property giro
	method direccionOpuesta() = este


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
		if (parteDelCuerpo.ultimaDireccion()==self.giro()){
			return"Giros/ArribaADerecha.png"
		}else{
			return self.imagenGiroIzquierda()
		}
	} 
	method imagenGiroIzquierda() = "Giros/AbajoADerecha.png" 

}


