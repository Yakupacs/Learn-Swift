//
//  ViewControllerSeriesDetails.swift
//  Training
//
//  Created by Enes Keskin on 8/12/22.
//

import UIKit

class ViewControllerSeriesDetails: UIViewController {

    var selectedSerie : Serie?
    
    @IBOutlet weak var serieAbout: UITextView!
    @IBOutlet weak var serieName: UILabel!
    @IBOutlet weak var serieImage: UIImageView!
    @IBOutlet weak var serieImdb: UILabel!
    @IBOutlet weak var serieStarredName: UILabel!
    @IBOutlet weak var serieStarredImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serieAbout.text = selectedSerie?.about
        serieName.text = selectedSerie?.name.uppercased()
        serieImdb.text = "IMBD : " + selectedSerie!.imbd
        serieImage.image = selectedSerie?.seriePhoto
        serieStarredName.text = selectedSerie?.starredName
        serieStarredImage.image = selectedSerie?.starredPhoto
    }
    

}
