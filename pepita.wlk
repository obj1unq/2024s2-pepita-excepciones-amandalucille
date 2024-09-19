object pepita {
	var energia = 100
	
	method comer(comida) {
		energia += comida.energiaQueAporta()
	}
	method puedeVolar(distancia){
		return energia >= self.energiaNecesaria(distancia) 
	}
	method energiaNecesaria(distancia){ // se crea para hacer el metodo puedeVolar polimorfico, ya que el código volar de pepon y de pepita son similares
		return 10 + distancia
	}
	method validarSiPuedeVolar(distancia){
		if (not self.puedeVolar(distancia)){
			self.error("Pepita no tiene energia suficiente")
		}
	}	
	method volar(distancia) {
		self.validarSiPuedeVolar(distancia)
		energia  -= self.energiaNecesaria(distancia)
	}
		
	method energia() {
		return energia
	}	
}
object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		energia += comida.energiaQueAporta() / 2
	} 
		
	method volar(distancia) {
		self.validarSiPuedeVolar(distancia)
		energia  -= self.energiaNecesaria(distancia)
	}
	method puedeVolar(distancia){  
		return energia > self.energiaNecesaria(distancia)
	}
	
	method energiaNecesaria(distancia){ 
		return 20 + (distancia * 2)
	}
	method validarSiPuedeVolar(distancia){
		if (not self.puedeVolar(distancia)){
			self.error("Pepon no tiene energia suficiente")
		}
	}
}


object roque {
	var ave = pepita
	var property cenas = 0
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
}

object milena {
    const aves = #{pepita, pepon}

    method movilizar(distancia) {  
		self.validarMovilizar(distancia)
		aves.forEach({ave => ave.volar(distancia)})	


    }
	//Validación para lanzar excepción. Detiene el flujo del programa si al condicion es True
	method validarMovilizar(distancia){
		if(not self.puedeMovilizar(distancia)){ //Se usa una consulta booleana para ver si hay que lanzarla.
			self.error("No puede movilizar a todas sus aves!")
		}
	}

	method puedeMovilizar(distancia){
		return aves.all({ave => ave.puedeVolar(distancia)})
	}
}

/*
const entrenamientos = {pepita,pepita,pepon,pepon,pepon}

ocurrencesOf -- saber cuantas veces aparece un determinado 
				elemento en una lista
ej : entranamientos.occurencesOf(pepon)

equivalente : entrenamientos.count({ave => ave == pepon})
*/
				