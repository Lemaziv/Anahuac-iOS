//
//  ActividadLoginViewController.swift
//  AnahuaciOS
//
//  Created by Universidad Anahuac on 12/09/22.
//

import UIKit

class ActividadLoginViewController: UIViewController {
    
    let colorTop = UIColor.init(_colorLiteralRed: 49/255, green: 128/255, blue: 229/255, alpha: 1).cgColor
    let colorBottom = UIColor.init(_colorLiteralRed: 86/255, green: 77/255, blue: 194/255, alpha: 1).cgColor

    let gradient = CAGradientLayer()
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var MidView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var homeImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient.colors = [colorTop, colorBottom]
        //gradient.frame = topView.bounds
        print(topView.bounds)
        gradient.frame = CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height/2)
        print(gradient.bounds)
        gradient.shouldRasterize = true
        topView.layer.addSublayer(gradient)
        // Do any additional setup after loading the view.
        
        //Middle view
        MidView.layer.cornerRadius = 10;
        MidView.layer.masksToBounds = true;
        
        MidView.layer.shadowColor = UIColor.black.cgColor
        MidView.layer.shadowOpacity = 0.2
        MidView.layer.shadowOffset = CGSize.init(width: 2, height: 2)
        MidView.layer.shadowRadius = 2
        MidView.layer.cornerRadius = 16
        
        //Login Button
        loginButton.layer.cornerRadius = 30
        loginButton.layer.masksToBounds = true
        
        //imageView
        topView.bringSubviewToFront(homeImageView)
        homeImageView.image = homeImageView.image?.withRenderingMode(.alwaysTemplate)
        homeImageView.tintColor = UIColor.white
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
