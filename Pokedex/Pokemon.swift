//
//  Pokemon.swift
//  Pokedex
//
//  Created by Stanley Pan on 2/9/16.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _baseAttack: String!
    private var _nextEvolutionText: String!
    private var _pokemonUrl: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonUrl)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                
                if let desc = dict["descriptions"] as? [Dictionary<String, String>] where desc.count > 0 {
                    
                    if let url = desc[0]["resource_uri"] {
                        let nsurl = NSURL(string: "\(URL_BASE)\(url)")!
                        Alamofire.request(.GET, nsurl).responseJSON { response in
                            let descriptionResult = response.result
                            if let descriptionDictionary = descriptionResult.value as? Dictionary<String, AnyObject> {
                                if let description = descriptionDictionary["description"] as? String {
                                    self._description = description
                                    print(self._description)
                                }
                            }
                            completed()
                        }
                    }
                } else {
                    self._description = ""
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0 {
                    
                    if let type = types[0]["name"] {
                        self._type = type.capitalizedString
                    }
                    
                    if types.count > 1 {
                        for var x = 1; x < types.count; x++ {
                            if let type = types[x]["name"] {
                                self._type! += "/\(type.capitalizedString)"
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                
                print(self._type)
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let attack = dict["attack"] as? Int {
                    self._baseAttack = "\(attack)"
                }
                
                print(self._defense)
                print(self._height)
                print(self._weight)
                print(self._baseAttack)
            }
        }
    }
}