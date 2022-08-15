//
//  ViewControllerDetails.swift
//  cityIntroduction
//
//  Created by Yakup Acis on 8/11/22.
//

import UIKit

class ViewControllerDetails: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityRegion: UILabel!
    @IBOutlet weak var cityName: UILabel!
    
    var selectedCity : City?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityName.text = selectedCity?.name
        cityRegion.text = selectedCity?.region
        imageView.image = selectedCity?.image
        
    }
    

    
}
