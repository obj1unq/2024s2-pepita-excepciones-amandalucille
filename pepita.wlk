object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	method validarSiPuedeVolar(distancia){
		if (distancia > energia){
			self.error("Pepita no tiene energia suficiente")
		}
	}	
	method volar(distancia) {
		self.validarSiPuedeVolar(distancia)
		energia = energia - 10 - distancia
	}
		
	method energia() {
		return energia
	}
	method puedeVolar(distancia){
		return distancia < energia
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
		energia += energia + comida.energiaQueAporta() / 2
	}
		
	method volar(distancia) {
		self.validarSiPuedeVolar(distancia)
		energia = energia - 20 - 2*distancia
	}
	method puedeVolar(distancia){
		return distancia < energia
	}
	
	method validarSiPuedeVolar(distancia){
		if (distancia > energia){
			self.error("Pepon no tiene energia suficiente")
		}
	}	
}

object roque {
	var ave = pepita
	var cenas = 0
	
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
	const aves = [pepita,pepon]   
		method movilizar(distancia){
			
	}
}
