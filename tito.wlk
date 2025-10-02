object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad) * self.inerciaBase() / self.peso()
    }
}

object whisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}

object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return (cantidad * 0.1).max(1)
    }
}

object licuado {
    const nutrientes = []

    method agregarNutrientes(nutriente){
        nutrientes.add(nutriente)
    }

    method rendimiento(cantidad){
        return nutrientes.sum() * (cantidad / 1000)
    }
}

object aguaSaborizada {
    var bebidaBase = whisky

    method cambiarBebidaBase(otraBebida){
        bebidaBase = otraBebida
    }

    method rendimiento(cantidad){
        const agua = cantidad * 0.75
        const resto = cantidad * 0.25
        return(agua / 1000) + bebidaBase.rendimiento(resto)
    }
}

object coctel {
    const bebidas = []
    method tamaño() = bebidas.size()

    method agregarBebida(bebida){
        bebidas.add(bebida)
    }

    method rendimiento(cantidad){
        var producto = 1
        if(self.tamaño() == 0) {
            return 0
        }
        else {
            bebidas.forEach{b => producto = producto * b.rendimiento(cantidad / self.tamaño())}
        }
        return producto
    }
}