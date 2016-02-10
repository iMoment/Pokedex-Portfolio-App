//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Stanley Pan on 2/11/16.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name
    }
}
