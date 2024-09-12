object interactuador{
    method obtenerPrimerElemento(key,accion){
      		const colliders = game.colliders(capy)
		if (colliders.isEmpty()) 
			throw new DomainException(message = "Apreta "+ key + accion, source = capy)
    return colliders.head()
    }
    method validarElemento(){
      
    }
  }