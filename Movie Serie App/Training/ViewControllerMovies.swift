//
//  ViewControllerMovies.swift
//  Training
//
//  Created by Enes Keskin on 8/12/22.
//

import UIKit

class ViewControllerMovies: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var movieArray = [Movie]()
    var movieChecked : Movie?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let focus = Movie(name: "Focus", about: "Nicky (Will Smith), a veteran con artist, takes a novice named Jess (Margot Robbie) under his wing. While Nicky teaches Jess the tricks of the trade, the pair become romantically involved; but, when Jess gets uncomfortably close, Nicky ends their relationship. Three years later, Nicky is in Buenos Aires working a very dangerous scheme when Jess -- now an accomplished femme fatale -- unexpectedly shows up. Her appearance throws Nicky for a loop at a time when he cannot afford to be off his game.", starredName: "Will Smith", imbd: "6.6", moviePhoto: UIImage(named: "focus")!, starredPhoto: UIImage(named:"willSmith")!)
        
        let forrestGump = Movie(name: "Forrest Gump", about: "Slow-witted Forrest Gump (Tom Hanks) has never thought of himself as disadvantaged, and thanks to his supportive mother (Sally Field), he leads anything but a restricted life. Whether dominating on the gridiron as a college football star, fighting in Vietnam or captaining a shrimp boat, Forrest inspires people with his childlike optimism. But one person Forrest cares about most may be the most difficult to save -- his childhood love, the sweet but troubled Jenny (Robin Wright).", starredName: "Tom Hanks", imbd: "8.8", moviePhoto: UIImage(named: "forrestGump")!, starredPhoto: UIImage(named:"tomHanks")!)
        
        let godFather = Movie(name: "The Godfather", about: "It is the first installment in The Godfather trilogy. The story, spanning from 1945 to 1955, chronicles the Corleone family under patriarch Vito Corleone (Brando), focusing on the transformation of his youngest son, Michael Corleone (Pacino), from reluctant family outsider to ruthless mafia boss.", starredName: "Al Pacino", imbd: "9.2", moviePhoto: UIImage(named: "theGodfather")!, starredPhoto: UIImage(named:"alPacino")!)
        
        movieArray = [focus, forrestGump, godFather]
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.contentView.backgroundColor = UIColorFromRGB(rgbValue: 4463122)
        self.tableView.backgroundColor = UIColorFromRGB(rgbValue: 4463122)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = movieArray[indexPath.row].name
        self.tableView.separatorColor = UIColor.black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieChecked = movieArray[indexPath.row]
        performSegue(withIdentifier: "toMoviesDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMoviesDetails"{
            let destVC = segue.destination as! ViewControllerMoviesDetails
            destVC.selectedMovie = movieChecked
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                movieArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }
        }

    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

