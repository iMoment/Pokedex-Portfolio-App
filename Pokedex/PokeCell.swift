//
//  PokeCell.swift
//  Pokedex
//
//  Created by Stanley Pan on 2/9/16.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        
        pokemonImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        pokemonNameLabel.text = self.pokemon.name.capitalizedString
    }
}