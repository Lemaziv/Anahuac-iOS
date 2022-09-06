//
//  PokemonListViewController.swift
//  AnahuaciOS
//
//  Created by Universidad Anahuac on 31/08/22.
//


import UIKit

class PokemonListViewController: UIViewController {

    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var pokemonTableView: UITableView!
    @IBOutlet weak var containerLoadingView: UIView!
    
    var pokemons: [Pokemon] = []
    var currentPokemon: Pokemon? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonTableView.register(UINib(nibName: "PokemonViewCell", bundle: nil), forCellReuseIdentifier: "pokemonCell")
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
        loadingIndicatorView.hidesWhenStopped = true
        loadingIndicatorView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
            self.loadPokemons()
        }

    }
    
    func loadPokemons(){
        let urlBase = "https://pokeapi.co/api/v2/"
        let listPokemonEndPoint = URL.init(string: "\(urlBase)pokemon?limit=100000&offset=0")!
        let task = URLSession.shared.dataTask(with: listPokemonEndPoint){data, response, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let result = try! jsonDecoder.decode(PokemonList.self, from: data)
                self.pokemons = result.results
                DispatchQueue.main.sync {
                    self.containerLoadingView.isHidden = true
                    self.loadingIndicatorView.stopAnimating()
                    self.pokemonTableView.reloadData()
                }
                
            }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pokemonDetailSegue" {
            let destino = segue.destination as? PokemonDetailViewController
            destino?.pokemon = currentPokemon
        }
    }
    
}

extension PokemonListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = pokemonTableView.dequeueReusableCell(withIdentifier: "pokemonCell") as? PokemonViewCell
        if(cell == nil){
            cell = PokemonViewCell()
        }
        let item = pokemons[indexPath.row]
        cell?.setupView(pokemon: item)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentPokemon = pokemons[indexPath.row]
        performSegue(withIdentifier: "pokemonDetailSegue", sender: nil)
    }


}
