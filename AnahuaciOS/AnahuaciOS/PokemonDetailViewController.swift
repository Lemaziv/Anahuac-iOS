//
//  PokemonDetailViewController.swift
//  AnahuaciOS
//
//  Created by Universidad Anahuac on 31/08/22.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var carouselCollectionView: UICollectionView!
    //@IBOutlet weak var pokemonImageView: UIImageView!
    var pokemon: Pokemon? = nil
    var imageList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageList.append("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png")
        imageList.append("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/132.png")
        // Do any additional setup after loading the view.
        carouselCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "imageCell")
        carouselCollectionView.dataSource = self
        
        loadPokemons()
    }
    
    func loadPokemons(){
        let listPokemonEndPoint = URL.init(string: pokemon!.url)!
        let task = URLSession.shared.dataTask(with: listPokemonEndPoint){data, response, error in
            //let pokemonDetail = try! JSONDecoder().decode(PokemonDetail.self, from: data!)
            //self.loadPokemonImage(urlImage: pokemonDetail.sprites.other.home.front_default)
        }
        task.resume()
    }
    
    /*func loadPokemonImage(urlImage: String){
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
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PokemonDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? CollectionViewCell
        if cell == nil {
            cell = CollectionViewCell()
        }
        let url = imageList[indexPath.row]
        cell?.loadImage(url: url)
        return cell!
    }
}

