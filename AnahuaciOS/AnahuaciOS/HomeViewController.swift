//
//  HomeViewController.swift
//  AnahuaciOS
//
//  Created by Universidad Anahuac on 22/08/22.
//

import UIKit

class Practica{
    var title: String
    var segueId: String
    
    init(title: String, segueId: String){
        self.title = title
        self.segueId = segueId
    }
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var practicasTableView: UITableView!
    let data: [Practica] = [
        Practica(title: "Login Facebook", segueId: "facebookSegue"),
        Practica(title: "Login Netflix", segueId: "toNetflixSegue")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        practicasTableView.dataSource = self
        practicasTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == data.last?.segueId{
            let loginNetflixViewController = segue.destination as? LoginNetflixViewController
            loginNetflixViewController?.txTitle = data.last?.title ?? ""
        }
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = practicasTableView.dequeueReusableCell(withIdentifier: "cell")
        if(cell == nil){
            cell = UITableViewCell()
        }
        let item = data[indexPath.row]
        cell?.textLabel?.text = item.title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data [indexPath.row]
        performSegue(withIdentifier: item.segueId, sender: nil)
    }
}
