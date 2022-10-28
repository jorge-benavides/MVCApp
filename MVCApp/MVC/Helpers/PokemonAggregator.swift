//
//  PokemonAggregator.swift
//  MVCApp
//
//  Created by Victor Pacheco on 28/10/22.
//

final class PokemonAggregator {
    private let pokedex = PokeDex()
    
    func addPokemon(pokemons: [Pokemon]) -> Pokemon? {
        guard let index = pokedex.pokemons.firstIndex(where: { $0.id == pokemons.last?.id }),
              pokedex.pokemons.count > index+1 else { return nil }
        return pokedex.pokemons[index+1]
    }
}
