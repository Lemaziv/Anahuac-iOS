//
//  PokemonViewCell.swift
//  AnahuaciOS
//
//  Created by Universidad Anahuac on 05/09/22.
//

import UIKit

class PokemonViewCell: UITableViewCell {
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.indicatorView.hidesWhenStopped = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(pokemon: Pokemon){
        self.pokemonNameLabel.text = pokemon.name
        self.loadPokemons(pokemon: pokemon)
    }
    
    func loadPokemons(pokemon: Pokemon){
        self.indicatorView.startAnimating()
        self.pokemonImageView.isHidden = true
        let listPokemonEndPoint = URL.init(string: pokemon.url)!
        let task = URLSession.shared.dataTask(with: listPokemonEndPoint){data, response, error in
            let pokemonDetail = try! JSONDecoder().decode(PokemonDetail.self, from: data!)
            self.loadPokemonImage(urlImage: pokemonDetail.sprites.other.home.front_default)
        }
        task.resume()
    }
    
    func loadPokemonImage(urlImage: String){
        let task = URLSession.shared.dataTask(with: URL(string: urlImage)!){data, response, error in
            if let data = data {
                let image = UIImage.init(data: data)
                DispatchQueue.main.sync{
                    self.indicatorView.stopAnimating()
                    self.pokemonImageView.image = image
                    self.pokemonImageView.isHidden = false
                }
            }
        }
        task.resume()
    }
    
}
