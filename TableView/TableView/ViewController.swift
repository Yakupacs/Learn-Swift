//
//  ViewController.swift
//  TableView
//
//  Created by Yakup Acis on 8/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var movieNames = [String]()
    var moviePics = [String]()
    var movieAbout = [String]()
    
    var selectedName = ""
    var selectedImage = ""
    var selectedAbout = ""
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        

        movieNames.append("The Shawshank Redemption")
        movieNames.append("One Flew Over The Cuckoo's Nest")
        movieNames.append("A Clockwork Orange")
        movieNames.append("12 Angry Men")
        movieNames.append("Focus")

        moviePics.append("esaretinBedeli")
        moviePics.append("gugukKusu")
        moviePics.append("otomatikPortakal")
        moviePics.append("12ofkeliAdam")
        moviePics.append("focus")

        movieAbout.append("Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.")
        movieAbout.append("A criminal pleads insanity and is admitted to a mental institution, where he rebels against the oppressive nurse and rallies up the scared patients.")
        movieAbout.append("In the future, a sadistic gang leader is imprisoned and volunteers for a conduct-aversion experiment, but it doesn't go as planned.")
        movieAbout.append("The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.")
        movieAbout.append("In the midst of veteran con man Nicky's latest scheme, a woman from his past - now an accomplished femme fatale - shows up and throws his plans for a loop.")
    }
    
    // numberOfRowsInSections -> Kaç tane row olacak?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieNames.count
    }

    // cellForRow atIndexPath -> Hücrenin içerisinde neler gösterilecek?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.contentView.backgroundColor = UIColor.black
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = movieNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            movieNames.remove(at: indexPath.row)
            moviePics.remove(at: indexPath.row)
            movieAbout.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = movieNames[indexPath.row]
        selectedImage = moviePics[indexPath.row]
        selectedAbout = movieAbout[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! ViewControllerDetails
            destinationVC.selectedMovieName = selectedName
            destinationVC.selectedMoviePicName = selectedImage
            destinationVC.selectedMovieAbout = selectedAbout
        }
    }
    
}

