import empleados.*
import ciudades.*
import centrosDeDistribucion.*

class Cliente {
		
		method puedeSerAtendido(vendedor){return vendedor.esVersatil() and vendedor.esFirme()}
	
}

class ClienteDetallista{
	
		method puedeSerAtendido(vendedor){return vendedor.certificacionesSobreProductos().size()>=3}
}
class ClienteHumanista{
	
		method puedeSerAtendido(vendedor){return vendedor.esPersonaFisica()}
}