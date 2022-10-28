//
//  PokemonsViewControllerComposer.swift
//  MVCApp
//
//  Created by Victor Pacheco on 28/10/22.
//

import Foundation

final class PokemonsViewControllerComposer {
    
    static func viewControllerComposed(with pokemonsViewModel: PokemonsViewModel,
                                               pokemonAggregator: PokemonAggregator) -> PokemonsViewController {
        let addPokemonController = AddPokemonController(pokemonAggregator: pokemonAggregator, pokemonsViewModel: pokemonsViewModel)
        let removePokemonController = RemovePokemonController(pokemonsViewModel: pokemonsViewModel)
        let pokemonsViewController = PokemonsViewController(viewModel: pokemonsViewModel, addPokemonController: addPokemonController, removePokemonController: removePokemonController)
        return pokemonsViewController
    }
}
