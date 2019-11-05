import empleados.*
import ciudades.*


class CentrosDeDstribucion {
	
		var property ciudad
		var property vendedores = []
		
			method agregarVendedor(vendedor){
				if(not vendedores.contains(vendedor)){
					vendedores.add(vendedor)
				}
				else {self.error("ya pertenece")}
			}

			method vendedorEstrella(){
				return vendedores.max({a=>a.cantDePuntos()})
			}
			method puedeCubrir(ciudadDada){
				vendedores.any{a=>a.puedeTrabajar(ciudad)}
			}
			method vendedoresGenericos(){
				
				return vendedores.filter{a=>a.esVersatil()}
			}
			method esRobusto(){
					var cantVendedoresFirmes = vendedores.filter{a=>a.esFirme()}.size()
					
				return cantVendedoresFirmes >=3
			}
			method agregarCertificacion(certificacion){
				vendedores.forEach({a=>a.agregarCertificaciones(certificacion)})
			}
}