//
//  AddPokemonController.swift
//  MVCApp
//
//  Created by Victor Pacheco on 28/10/22.
//

import UIKit

final class AddPokemonController {
    private(set) lazy var view = UIButton.systemButton(with: .add, target: self, action: #selector(addButtonPressed))
    private let pokemonAggregator: PokemonAggregator
    private let pokemonsViewModel: PokemonsViewModel
    
    var didAddPokemon: (() -> Void)?

    init(pokemonAggregator: PokemonAggregator, pokemonsViewModel: PokemonsViewModel) {
        self.pokemonAggregator = pokemonAggregator
        self.pokemonsViewModel = pokemonsViewModel
    }
    
    @objc func addButtonPressed() {
        guard let pokemon = pokemonAggregator.addPokemon(pokemons: pokemonsViewModel.pokemons) else { return }
        pokemonsViewModel.addPokemon(pokemon: pokemon)
        didAddPokemon?()
    }
}
