import aparicionesDeElementos.*
import comestibles.*
import snake.*
import wollok.game.*

object ardillasPeligrosas {
	var property conjuntoDeArdillas=[]
	var elementoSeleccionado
	
	method agregarArdillaPeligrosa(unaArdilla){
		conjuntoDeArdillas.add(unaArdilla)
	}
	
	method eliminarAAlguien(){
			elementoSeleccionado=conjuntoDeArdillas.anyOne()
			elementoSeleccionado.fuisteEliminado()
			conjuntoDeArdillas.remove(elementoSeleccionado)
	}
	
	method borrarTodasLasArdillas(){
		conjuntoDeArdillas.forEach({ardilla =>conjuntoDeArdillas.remove(ardilla)})
	}
}
