//
//  Pokedex.swift
//  MVCApp
//
//  Created by Jorge Benavides
//

import Foundation

class PokeDex {
    var pokemons: [Pokemon] = {
        guard
            let url = Bundle.main.url(forResource: "pokemons", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let pokemons = try? JSONDecoder().decode([Pokemon].self, from: data)
        else {
            return []
        }
        return pokemons
    }()
}

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let image: String
    let weight: Int
    let base_experience: Int
    let types: [String]
    let abilities: [String]
}
