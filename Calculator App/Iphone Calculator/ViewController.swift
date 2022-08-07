//
//  ViewController.swift
//  Iphone Calculator
//
//  Created by Yakup Acis on 8/4/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnBolme: UIButton!
    @IBOutlet weak var btnSekiz: UIButton!
    @IBOutlet weak var btnBir: UIButton!
    @IBOutlet weak var btnEsittir: UIButton!
    @IBOutlet weak var btnVirgul: UIButton!
    @IBOutlet weak var btnSifir: UIButton!
    @IBOutlet weak var btnArti: UIButton!
    @IBOutlet weak var btnUc: UIButton!
    @IBOutlet weak var btnIki: UIButton!
    @IBOutlet weak var btnEksi: UIButton!
    @IBOutlet weak var btnAlti: UIButton!
    @IBOutlet weak var btnBes: UIButton!
    @IBOutlet weak var btnDort: UIButton!
    @IBOutlet weak var btnCarpi: UIButton!
    @IBOutlet weak var btnDokuz: UIButton!
    @IBOutlet weak var btnYedi: UIButton!
    @IBOutlet weak var btnYuzde: UIButton!
    @IBOutlet weak var btnArtiEksi: UIButton!
    @IBOutlet weak var txtSonuc: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAC.layer.cornerRadius = 40
        btnBolme.layer.cornerRadius = 40
        btnYuzde.layer.cornerRadius = 40
        btnArtiEksi.layer.cornerRadius = 40
        btnYedi.layer.cornerRadius = 40
        btnSekiz.layer.cornerRadius = 40
        btnDokuz.layer.cornerRadius = 40
        btnCarpi.layer.cornerRadius = 40
        btnDort.layer.cornerRadius = 40
        btnBes.layer.cornerRadius = 40
        btnAlti.layer.cornerRadius = 40
        btnEksi.layer.cornerRadius = 40
        btnBir.layer.cornerRadius = 40
        btnIki.layer.cornerRadius = 40
        btnUc.layer.cornerRadius = 40
        btnArti.layer.cornerRadius = 40
        btnSifir.layer.cornerRadius = 40
        btnVirgul.layer.cornerRadius = 40
        btnEsittir.layer.cornerRadius = 40
        // Do any additional setup after loading the view.
    }
    var result = 0
    var depo = 0
    @IBAction func fnctAC(_ sender: Any) {
        txtSonuc.text = "0"
        result = 0
        depo = 0
    }
    @IBAction func funcArtiEksi(_ sender: Any) {
        if (txtSonuc.text == "0"){
            return
        }
        result = result * (-1)
        txtSonuc.text = String(result)
    }
    @IBAction func funcYedi(_ sender: Any) {
        result = result * 10
        result = result + 7
        txtSonuc.text = String(result)
    }
    @IBAction func funcSekiz(_ sender: Any) {
        result = result * 10
        result = result + 8
        txtSonuc.text = String(result)
    }
    @IBAction func funcTopla(_ sender: Any) {
        depo += result
        result = 0
        txtSonuc.text = "0"
        if (depo != 0){
            txtSonuc.text = String(depo)
            return
        }
    }
    @IBAction func funcEsittir(_ sender: Any) {
        depo += result
        txtSonuc.text = String(depo)
        
    }
    @IBAction func funcDokuz(_ sender: Any) {
        result = result * 10
        result = result + 9
        txtSonuc.text = String(result)
    }
    @IBAction func funcDort(_ sender: Any) {
        result = result * 10
        result = result + 4
        txtSonuc.text = String(result)
    }
    @IBAction func funcBes(_ sender: Any) {
        result = result * 10
        result = result + 5
        txtSonuc.text = String(result)
    }
    @IBAction func funcAlti(_ sender: Any) {
        result = result * 10
        result = result + 6
        txtSonuc.text = String(result)
    }
    @IBAction func funcBir(_ sender: Any) {
        result = result * 10
        result = result + 1
        txtSonuc.text = String(result)
    }
    @IBAction func funcIki(_ sender: Any) {
        result = result * 10
        result = result + 2
        txtSonuc.text = String(result)
    }
    @IBAction func funcUc(_ sender: Any) {
        result = result * 10
        result = result + 3
        txtSonuc.text = String(result)
    }
    @IBAction func funcSifir(_ sender: Any) {
        result = result * 10
        txtSonuc.text = String(result)
    }
    @IBAction func funcCikarma(_ sender: Any) {
        if (depo == 0)
        {
            result *= -1
        }
        depo = depo - result
        result = 0
        txtSonuc.text = "0"
        if (depo != 0){
            txtSonuc.text = String(depo)
            return
        }
    }
    @IBAction func btnCarp(_ sender: Any) {
        depo *= result
        result = 0
        txtSonuc.text = "0"
        if (depo != 0){
            txtSonuc.text = String(depo)
            return
        }
    }
}

