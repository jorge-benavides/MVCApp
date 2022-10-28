//
//  PokemonCellController.swift
//  MVCApp
//
//  Created by Victor Pacheco on 28/10/22.
//

import UIKit

final class PokemonCellController: UITableViewCell {
    func configured(with pokemon: Pokemon) -> UITableViewCell {
        var config = defaultContentConfiguration()
        config.text = pokemon.name
        config.image = UIImage(named: pokemon.image)
        config.imageProperties.maximumSize = .init(width: 80, height: 80)
        contentConfiguration = config
        return self
    }
}
