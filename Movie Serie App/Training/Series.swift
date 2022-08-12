//
//  Series.swift
//  Training
//
//  Created by Enes Keskin on 8/12/22.
//

import Foundation
import UIKit

class Serie {
    
    var name : String
    var about : String
    var starredName : String
    var imbd : String
    var seriePhoto : UIImage
    var starredPhoto : UIImage
    
    init(name: String, about: String,starredName: String, imbd : String,seriePhoto : UIImage, starredPhoto : UIImage) {
        
        self.name = name
        self.about = about
        self.starredName = starredName
        self.imbd = imbd
        self.seriePhoto = seriePhoto
        self.starredPhoto = starredPhoto
        
    }
}
