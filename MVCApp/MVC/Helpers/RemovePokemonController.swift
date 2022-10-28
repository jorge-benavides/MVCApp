//
//  RemovePokemonController.swift
//  MVCApp
//
//  Created by Victor Pacheco on 28/10/22.
//

import UIKit

final class RemovePokemonController {
    private(set) lazy var view = UIButton.systemButton(with: .remove, target: self, action: #selector(removeButtonPressed))
    private let pokemonsViewModel: PokemonsViewModel
    private var pokemonToRemoveIndex: Int?
    
    var didRemovePokemon: (() -> Void)?

    init(pokemonsViewModel: PokemonsViewModel) {
        self.pokemonsViewModel = pokemonsViewModel
    }
    
    func pokemonToRemove(_ index: Int?) {
        pokemonToRemoveIndex = index
    }
    
    @objc func removeButtonPressed() {
        guard let pokemonToRemoveIndex = pokemonToRemoveIndex else { return }
        pokemonsViewModel.removePokemon(at: pokemonToRemoveIndex)
        self.pokemonToRemoveIndex = nil
        didRemovePokemon?()
    }
}
