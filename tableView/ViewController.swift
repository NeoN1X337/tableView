//
//  ViewController.swift
//  tableView
//
//  Created by Алдияр Женисулы on 29.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var BrandLabel: UILabel!
    
    @IBOutlet weak var ModelLabel: UILabel!
    
    var car = Car()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        BrandLabel.text = car.brand
        ModelLabel.text = car.model
        ImageView.image = UIImage(named: car.imageName)
    }


}

