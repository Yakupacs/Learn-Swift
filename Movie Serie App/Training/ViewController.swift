//
//  ViewController.swift
//  Training
//
//  Created by Enes Keskin on 8/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnSerie: UIButton!
    @IBOutlet weak var btnMovie: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        btnSerie.layer.cornerRadius = 20
        btnMovie.layer.cornerRadius = 20
    }

    @IBAction func funcMovie(_ sender: Any) {
        performSegue(withIdentifier: "toMovies", sender: nil)
        
    }
    @IBAction func funcSerie(_ sender: Any) {
        performSegue(withIdentifier: "toSeries", sender: nil)
    }

    func assignbackground(){
        let background = UIImage(named: "background.jpeg")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.alpha = 0.3
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
      }

}


