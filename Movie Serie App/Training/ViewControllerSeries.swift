//
//  ViewControllerSeries.swift
//  Training
//
//  Created by Enes Keskin on 8/12/22.
//

import UIKit

class ViewControllerSeries: UIViewController, UITableViewDataSource, UITableViewDelegate  {

  
    var serieArray = [Serie]()
    var serieChecked : Serie?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        let prisonBreak = Serie(name: "Prison Break", about: "Michael Scofield is a desperate man in a desperate situation. His brother, Lincoln Burrows, was convicted of a crime he didn't commit and put on Death Row. Michael holds up a bank to get himself incarcerated alongside his brother in Fox River State Penitentiary, then sets in motion a series of elaborate plans to break Lincoln out and prove his innocence. Once out of jail, their perils aren't over -- the brothers must flee to escape recapture and battle an intricate political conspiracy that puts everyone's life at risk.", starredName: "Wentworth Miller", imbd: "8.3", seriePhoto: UIImage(named: "prisonBreak")!, starredPhoto: UIImage(named:"wentworthMiller")!)
        
        let thePunisher = Serie(name: "The Punisher", about: "After exacting revenge on the people responsible for the deaths of his wife and children, Frank Castle uncovers a conspiracy that runs deeper than New York's criminal underworld. Now known as the Punisher, he must dig deep into the conspiracy to discover the truth about injustices that affect more than just him and his family. Assisting the vigilante in his quest to fight criminals are best friend Billy Russo, who runs private military corporation Anvil, and former NSA analyst Micro, who shares common enemies with Castle and helps him as part of a so-called marriage of convenience.", starredName: "Jon Bernthal", imbd: "8.5", seriePhoto: UIImage(named: "thePunisher")!, starredPhoto: UIImage(named:"jonBernthal")!)
        
        let sahsiyet = Serie(name: "Şahsiyet", about: "Agâh Beyoğlu is a 65-year-old retired court clerk whose spouse died some time ago. Agâh lives alone in an old Ottoman building bearing the name of his deceased spouse, Mebrure, in Beyoğlu. One day, his beloved cat Münir Bey dies, since Agâh forgets to feed him. After the incident, he goes to a doctor to figure out the reasons of his memory impairment and there he is diagnosed with Alzheimer's disease. Agâh can't accept the fact that he has Alzheimer's disease and becomes depressed. One day, when Agâh meets his friends at an invitation, he discerns some advantages of his disease and makes a decision which is a turning point.", starredName: "Haluk Bilginer", imbd: "9.1", seriePhoto: UIImage(named: "sahsiyet")!, starredPhoto: UIImage(named:"halukBilginer")!)
        
            serieArray = [prisonBreak, thePunisher, sahsiyet]
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serieArray.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.contentView.backgroundColor = UIColorFromRGB(rgbValue: 4463122)
        self.tableView.backgroundColor = UIColorFromRGB(rgbValue: 4463122)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = serieArray[indexPath.row].name
        self.tableView.separatorColor = UIColor.black
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        serieChecked = serieArray[indexPath.row]
        performSegue(withIdentifier: "toSeriesDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSeriesDetails"{
            let destVC = segue.destination as! ViewControllerSeriesDetails
            destVC.selectedSerie = serieChecked
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                serieArray.remove(at: indexPath.row)
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
