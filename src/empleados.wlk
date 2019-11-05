import ciudades.*
import centrosDeDistribucion.*

object lopezYLopez {
	
		var property vendedores = []
		var property clientes = []
		
}

class Vendedor {
	
		var property certificaciones =#{}
		var cantDePuntos = certificaciones.sum({a=>a.cantidadDePuntos()})	
			
			method puedeTrabajar(enCiudad)
			method esVersatil() {
				return certificaciones.size()>=3 and certificaciones.any{a=>a.esSobreProductos()} and
					   certificaciones.any{a=>not a.esSobreProductos()}
			}
			method esFirme() = cantDePuntos >= 30
			method esInfluyente()
			method agregarCertificacion(certificacion){certificaciones.add(certificacion)}	
			method tieneAfinidad(centroDeDistribucion){return self.puedeTrabajar(centroDeDistribucion.ciudad())}
			method esCandidato(paraElCentro) = self.esVersatil() and self.tieneAfinidad(paraElCentro) 
			method certificacionesSobreProductos(){return certificaciones.filter{a=>a.esSobreProducts()}}
			method esPersonaFisica(){return true}
}

class VendedorFijo inherits Vendedor{
	
		var property ciudad
		
		
			
   override method puedeTrabajar(enCiudad){
				return enCiudad == ciudad
			}
 
   override method esInfluyente() = false
				
			
}

class Viajante inherits Vendedor{
		
		var property provinciasHabilitado = []
		
		
		
   override method puedeTrabajar(ciudad){
				return provinciasHabilitado.contains(ciudad.provinciaQuePertenece())
			}
			
   override method esInfluyente() {
				return provinciasHabilitado.sum({a=>a.poblacion()}) >= 10000000
			}
			
}
class ComercioCorresponsal inherits Vendedor{
	
		var property ciudadesConSucursales = []
		
		
		
			
   override method puedeTrabajar(ciudad){
				return ciudadesConSucursales.contains(ciudad)
			}
			
   override method esInfluyente(){
				return ciudadesConSucursales.size()>5 or self.provinciasConSucursales().size()>=3
			}
   override method tieneAfinidad(centroDeDistribucion){
   				return super(centroDeDistribucion.ciudad()) and 
   							ciudadesConSucursales.any{c=>not centroDeDistribucion.puedeCubrir(c)} 
   			}			
   			
   			method provinciasConSucursales(){
   		 	
   		 		return ciudadesConSucursales.map{a=>a.provinciaQuePertenece()}.asSet()
   			}
   override method esPersonaFisica(){return false} 		
			
}




class Certificaciones{
	
	var property cantidadDePuntos	// NUMERICO
	var property esSobreProductos  // BOOLEANO
}
