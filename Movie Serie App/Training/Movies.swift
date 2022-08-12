//
//  Movies.swift
//  Training
//
//  Created by Enes Keskin on 8/12/22.
//

import Foundation
import UIKit

class Movie {
    
    var name : String
    var about : String
    var starredName : String
    var imdb : String
    var moviePhoto : UIImage
    var starredPhoto : UIImage
    
    
    init(name: String, about: String,starredName: String, imbd : String, moviePhoto : UIImage, starredPhoto : UIImage) {
        
        self.name = name
        self.about = about
        self.starredName = starredName
        self.imdb = imbd
        self.moviePhoto = moviePhoto
        self.starredPhoto = starredPhoto
        
    }
}
