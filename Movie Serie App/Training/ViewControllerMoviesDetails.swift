//
//  ViewControllerMoviesDetails.swift
//  Training
//
//  Created by Enes Keskin on 8/12/22.
//

import UIKit

class ViewControllerMoviesDetails: UIViewController {

    @IBOutlet weak var movieAbout: UITextView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieIMDB: UILabel!
    @IBOutlet weak var movieStarredName: UILabel!
    
    @IBOutlet weak var movieStarredImage: UIImageView!
    
    var selectedMovie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieAbout.text = selectedMovie?.about
        movieName.text = selectedMovie?.name.uppercased()
        movieIMDB.text = "IMBD : " + selectedMovie!.imdb
        movieImage.image = selectedMovie?.moviePhoto
        movieStarredName.text = selectedMovie?.starredName
        movieStarredImage.image = selectedMovie?.starredPhoto
        
    }
    
}
