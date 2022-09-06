//
//  PokemonDetailViewController.swift
//  AnahuaciOS
//
//  Created by Universidad Anahuac on 31/08/22.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var pokemonImageView: UIImageView!
    var pokemon: Pokemon? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadPokemons()
    }
    
    func loadPokemons(){
        let listPokemonEndPoint = URL.init(string: pokemon!.url)!
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
                    self.pokemonImageView.image = image
                }
            }
        }
        task.resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
