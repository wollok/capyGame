object capy {
  const basuras = []
  
  var property position = game.origin()
 
  method image() = "capy_" + (if (self.tieneAlgoMuyMalo()) "triste" else "tranqui") + ".png"
  
  method tieneAlgoMuyMalo() = basuras.any{b=>b.huella() > 500}
  
  method recoger(basura){
    game.removeVisual(basura)
    basuras.add(basura)
  }

  method deciTotalHuella() {
    game.say(capy," total " + basuras.sum{b=>b.huella()})
  }
  method tratar(){
      //basuras.first().tratate()
      //game.say(plantaDeTratamiento,"a tratar: " + (basuras.filter{basura=>planta.recibe(basura)}).toString())
      basuras.forEach{b=>b.tratate()}
  }
  method soltar(){
    game.addVisual(basuras.last())
    basuras.remove(basuras.last()) 
  }
  method deciTuCantidadDeBasura(){
    game.say(self,"cantidad basura " + basuras.size())
  }
  method deciCuantosSonReciclables(){
    game.say(self,"cantidad reciclables " + self.contarReciclables())
  }
  method contarReciclables() = 
    basuras.count({basura => basura.esReciclable()})
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
  method huella() = longitud * 50
 
  method image() = "lata_roja.png"
  method esReciclable()= true
}

object botellaDeGaseosa {
  var property huella = 100
  var property position = posicionAleatoria.calcular()
  method image() = "lata_naranja.png"

  method tratate(){
    huella = huella - 5
    game.say(plantaDeTratamiento,"lata reciclada, huella " + huella)
  }

  method esReciclable()= true


}

object barrilDeCombustible {
  var property combustible = petroleo
  var property position = posicionAleatoria.calcular()
  method image() = "residuos-toxicos.png"

  method tratate(){
     game.say(plantaDeTratamiento,"barril no se puede tratar " )

  }

  method esReciclable()= false
  method huella() = combustible.consumo()
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