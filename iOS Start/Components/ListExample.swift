//
//  ListExample.swift
//  iOS Start
//
//  Created by Jaime Serrano on 9/11/24.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Jaime"),
    Pokemon(name: "Jose"),
    Pokemon(name: "Andres")
]
var digimons = [
    Digimon(name: "Ana"),
    Digimon(name: "Camila"),
    Digimon(name: "Sara")
]

struct ListExample: View {
    var body: some View {
        //        List{
        //            Text("Hello, World!")
        //            Text("Hello, World!")
        //            Text("Hello, World!")
        //        }
        List{
            ForEach(pokemons, id:\.name) { pokemon in
                Text(pokemon.name)
            }
        }
        List(digimons) { digimon in
            Text(digimon.name)}
    
        List{
            ForEach(digimons) { digimon in
                Text(digimon.name)
            }
        }
        List{
            Section(header: Text("Pokemons")) {
                ForEach(pokemons, id:\.name) { pokemon in
                    Text(pokemon.name)
                }
            }
        }
    }
}
struct Pokemon{
        let name:String
    }
    
struct Digimon: Identifiable{
    var id = UUID()
    let name:String
}
    #Preview {
        ListExample()
    }

