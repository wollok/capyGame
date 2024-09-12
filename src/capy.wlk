object capy {
  const basuras = []
  
  var property position = game.origin()
 
  method image() = "capy_tranqui.png"
  
  method recoger(basura){
    game.removeVisual(basura)
    basuras.add(basura)
  }
  method tratar(){
      basuras.first().tratate()
  }
  method soltar(){
    game.addVisual(basuras.last())
    basuras.remove(basuras.last()) 
  }
  method deciTuCantidadDeBasura(){
    game.say(self,"cantidad basura " + basuras.size())
  }
  method deciCuantosSonReciclables(){
   // game.say(self,"cantidad reciclables " + if(basura == null) 0 else if (basura.esReciclable()) 1 else 0)
  }
 // method basurasReciclables()= basuras.filter({basura => basura.esReciclable()})
 // 
 // method decirCantidadDe(lista){
 //   game.say(self,lista.size().toString())
 // }

}



object posicionAleatoria {
  method calcular() = game.at(
    0.randomUpTo(game.width()).truncate(0),
    0.randomUpTo(game.width()).truncate(0)
  )
}

object lataDeCerveza {
  var longitud = 40
  var property position = posicionAleatoria.calcular()
 
  method tratate() {
    longitud = longitud * 0.9
    game.say(plantaDeTratamiento,"lata reciclada, longitud " + longitud)
  }
 
  method image() = "lata_roja.png"
  method esReciclable()= true
}

object botellaDeGaseosa {
  var huella = 100
  var property position = posicionAleatoria.calcular()
  method image() = "lata_naranja.png"

  method tratate(){
    huella = huella - 5
    game.say(plantaDeTratamiento,"lata reciclada, huella " + huella)
  }

  method esReciclable()= true


}

object barrilDeCombustible {
  var property position = posicionAleatoria.calcular()
  method image() = "residuos-toxicos.png"

  method tratate(){
     game.say(plantaDeTratamiento,"barril no se puede tratar " )

  }

  method esReciclable()= false

}

object plantaDeTratamiento {
  var property position = game.at(8, 8)
  
  method image() = "planta.png"
  
}

object petroleo {
  method consumo() = 1200
}

object biogas {
  /* el biogas es el resultado de la degradación
  de materia degradable, así que en si es una forma de reciclar */
  method consumo() = 0
}

object gasoil {
  var pureza = 0.4
  
  method pureza(porentaje) {
    pureza = porentaje
  }
  
  method consumo() = 500 * pureza
}