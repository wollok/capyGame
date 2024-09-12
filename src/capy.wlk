object capy {
 // const basuras = []
  var property position = game.origin()
  method image() = "capy_tranqui.png"
  method recoger(basura){
    game.removeVisual(basura)
  //  basuras.add(basura)
  }
  method tratar(planta){
 //   basuras.last().tratate()
  }
  method soltar(){
  //  game.addVisual(basuras.last())
 //   basuras.remove(basuras.last())
  }
  method deciTuCantidadDeBasura(){
  //  self.decirCantidadDe(basuras)
  }
  method deciCuantosSonReciclables(){
 //   self.decirCantidadDe(self.basurasReciclables())
  }
 // method basurasReciclables()= basuras.filter({basura => basura.esReciclable()})
 // 
 // method decirCantidadDe(lista){
 //   game.say(self,lista.size().toString())
 // }

}