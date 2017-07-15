//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Tom Dobson on 7/14/17.
//  Copyright © 2017 Dobson Studios. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var EvoLbl: UILabel!
    
    
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemon.downloadPokemonDetails() {
            
            self.updateUI()
            
        }
    }
    
    func updateUI() {
        nameLbl.text = pokemon.name.capitalized
        pokedexIdLbl.text = "\(pokemon.pokedexId)"
        weightLbl.text = pokemon.weight
        heightLbl.text = pokemon.height
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        nextEvo()
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.descriptions
        mainImg.image = UIImage(named: "\(pokemon.pokedexId)")
        currentEvoImg.image = UIImage(named: "\(pokemon.pokedexId)")
        nextEvoImg.image = UIImage(named: "\(pokemon.nextEvoID)")
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func nextEvo() {
        switch pokemon.nextEvoLvl {
        case "": EvoLbl.text = "No Further Evolutions"
        default: EvoLbl.text = "Next Evolution: \(pokemon.nextEvoText.capitalized) LVL \(pokemon.nextEvoLvl)"
        }
    }
    
}
