import SwiftUI
import Foundation
struct Persona {
    let nombre: String
    let fechaN: String
    let sexo: String
    let nroDocumento: String
    let hermanos: String
    let correo: String
    var usuario: String?
    
    init (nombre: String, fechaN: String, sexo: String, nroDocumento: String, hermanos: String, correo: String) {
        self.nombre = nombre
        self.fechaN = fechaN
        self.nroDocumento = nroDocumento
        self.sexo = sexo
        self.correo = correo
        self.hermanos = hermanos
    }
    
    func Name() -> String{
        var nameCap = nombre.split(separator: " ")
        nameCap = nameCap.map{$0.prefix(1) + $0.lowercased().dropFirst()}
        if nameCap.count == 3 {
            return (nameCap[0] + " " + nameCap[1] + " " + nameCap[2].prefix(1) + ".")
        } else {
            return (nameCap[0] + " " + nameCap[nameCap.count-2] + " " + nameCap[nameCap.count-1].prefix(1) + ".")
        }
    }
    
    func Edad() ->Int{
        let fecha = fechaN.split(separator: "/")
        let dia = Int(fecha[0])!
        let mes = Int(fecha[1])!
        let anho = Int(fecha[2])!
        let edad = CalcularEdad(day: dia, month: mes, year: anho)
        return edad
    }
    
    func CalcularEdad(day: Int, month: Int, year: Int) -> Int {
        let date = Date()
        let formato = DateFormatter()
        formato.dateFormat = "dd/mm/yyyy"
        let fechaAC = formato.string(from: date).split(separator: "/")
        let diaAC = Int(fechaAC[0])!
        let mesAC = Int(fechaAC[1])!
        let anhoAC = Int(fechaAC[2])!
        return (anhoAC-year) + ((mesAC-month)/12) + ((diaAC-day)/365)
    }
    
    func Hermanos() ->Int {
        let cantidad = hermanos.split(separator: " ")
        let cantHermanos = Int(cantidad[1]) ?? 0
        return cantHermanos
    }
    
    mutating func User() -> String{
        let generando = String(correo.split(separator: "@").first!)
        usuario = generando
        return usuario!
    }
}
// Creamos la lista de personas
var lista: [Persona] = []
//Colocamos las variables de entrada a las estructuras
var persona1 = Persona(nombre: "CARLOS JOSÉ ROBLES GOMES", fechaN: "06/08/1995", sexo: "Masculino", nroDocumento: "78451245", hermanos: "tiene 2 hermanos", correo: "carlos.roblesg@hotmail.com")

let persona2 = Persona(nombre: "MIGUEL ANGEL QUISPE OTERO", fechaN: "28/12/1995", sexo: "Masculino", nroDocumento: "79451654", hermanos: "no tiene hermanos",correo: "miguel.anguel@gmail.com")

let persona3 = Persona(nombre: "KARLA ALEXANDRA FLORES ROSAS", fechaN: "15/02/1997", sexo: "Femenino", nroDocumento: "77485812", hermanos: "tiene 1 hermanos",correo: "Karla.alexandra@hotmail.com")

let persona4 = Persona(nombre: "NICOLAS QUISPE ZEVALLOS", fechaN: "08/10/1990", sexo: "Masculino", nroDocumento: "71748552", hermanos: "tiene 1 hermanos",correo: "nicolas123@gmail.com")

let persona5 = Persona(nombre: "PEDRO ANDRE PICASSO BETANCUR", fechaN: "17/05/1994", sexo: "Masculino", nroDocumento: "74823157", hermanos: "tiene 2 hermanos" ,correo: "pedroandrepicasso@gmail.com")

let persona6 = Persona(nombre: "FABIOLA MARIA PALACIO VEGA", fechaN: "02/02/1992", sexo: "Femenino", nroDocumento: "76758254", hermanos: "no tiene hermanos" ,correo: "mailto:fabi@hotmail.com")
// añadimos a la lista
lista.append(persona1)
lista.append(persona2)
lista.append(persona3)
lista.append(persona4)
lista.append(persona5)
lista.append(persona6)

// imprimimos los nombres con el formato
for perso in lista {
    print(perso.Name())
}

// Buscamos la persona con mayor y menor edad
var arregloEdad = lista.sorted{$0.Edad() > $1.Edad()}
var mayor = arregloEdad[0].Name()
var menor = arregloEdad[arregloEdad.count-1].Name()
//imprimimos la persona mayor y menor
print("La persona de mayor edad es \(mayor)\nLa persona de menor edad es \(menor)")

// creamos las listas de Mujeres y Hombres
var listaMujeres: [String] = []
var listaHombres: [String] = []
//separamos por genero
for genero in lista {
    if genero.sexo == "Femenino" {
        listaMujeres.append(genero.Name())
    } else {
        listaHombres.append(genero.Name())
    }
}
//imprimmos la cantidad de hombres y mujeres
print("Son \(listaHombres.count) Hombres y \(listaMujeres.count) Mujeres")

//creamos una lista para las perosnas con mas de dos hermanos
var arregloHermano: [String] = []
//añadimos a la lista las personas con mas de dos hermanos
for hermano in lista {
    if hermano.Hermanos() > 2 {
        arregloHermano.append(hermano.Name())
    }
}
//imprimimos la cantidad personas con mas de dos hermanos
if arregloHermano.count > 0 {
    print("Las personas con mas de dos hermano son: \(arregloHermano)")
} else {
    print("Nadie tiene mas de 2 hermanos")
}

//generamos e imprimimos los usuarios
for var u in lista {
    print(u.User())
}
