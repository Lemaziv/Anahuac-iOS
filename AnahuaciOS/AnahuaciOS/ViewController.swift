//
//  ViewController.swift
//  AnahuaciOS
//
//  Created by Universidad Anahuac on 17/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputsView: UIView!
    @IBOutlet weak var logoimageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoimageView.layer.cornerRadius = logoimageView.bounds.width / 2
        logoimageView.clipsToBounds = true
        inputsView.layer.borderWidth = 3
        inputsView.layer.cornerRadius = 16
        inputsView.layer.borderColor = UIColor.init(red: 169/265, green: 169/265, blue: 169/265, alpha: 1).cgColor
    }


}

