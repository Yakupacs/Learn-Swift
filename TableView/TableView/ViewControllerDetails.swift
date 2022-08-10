//
//  ViewControllerDetails.swift
//  TableView
//
//  Created by Yakup Acis on 8/10/22.
//

import UIKit

class ViewControllerDetails: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieAbout: UILabel!
    
    var selectedMovieName = ""
    var selectedMoviePicName = ""
    var selectedMovieAbout = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: selectedMoviePicName)
        label.text = selectedMovieName
        movieAbout.text = selectedMovieAbout

    }

}
