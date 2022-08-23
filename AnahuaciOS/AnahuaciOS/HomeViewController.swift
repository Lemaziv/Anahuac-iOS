//
//  HomeViewController.swift
//  AnahuaciOS
//
//  Created by Universidad Anahuac on 22/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var practicasTableView: UITableView!
    let data: [String] = ["Login Facebook", "continuará"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        practicasTableView.dataSource = self
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
        cell?.textLabel?.text = item
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data [indexPath.row]
        print("click: \(item)")
    }
}
