//
//  ViewController.swift
//  MachineLearningImageRecognition
//
//  Created by Yakup on 24.12.2022.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var chosenImage = CIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeClicked(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
        if let ciImage = CIImage(image: imageView.image!){
            chosenImage = ciImage
        }
        
        recognizeImage(chosenImage)
    }
    
    func recognizeImage(_ image: CIImage){
        
        resultLabel.text = "Finding..."
        // MARK: - Request
        
        if let model = try? VNCoreMLModel(for: MobileNetV2().model){
            let request = VNCoreMLRequest(model: model) { (vnrequest, error) in
                if let results = vnrequest.results as? [VNClassificationObservation]{
                    
                    if results.count > 0{
                        
                        let topResult = results[0]
                        let secondResult = results[1]
                        let thirdResult = results[2]
                        
                        DispatchQueue.main.async {
                            
                            let confidenceLevelTop = (topResult.confidence) * 100
                            let confidenceLevelSecond = (secondResult.confidence) * 100
                            let confidenceLevelThird = (thirdResult.confidence) * 100
                            
                            let roundedTop = Int(confidenceLevelTop * 100) / 100
                            let roundedSecond = Int(confidenceLevelSecond * 100) / 100
                            let roundedThird = Int(confidenceLevelThird * 100) / 100
                            
                            self.resultLabel.text = "\(roundedTop)% \(topResult.identifier)\n\(roundedSecond)% \(secondResult.identifier)\n\(roundedThird)% \(thirdResult.identifier)\n"
                            
                        }
                        
                    }
                    
                }
            }
            
            // MARK: - Handler
            
            let handler = VNImageRequestHandler(ciImage: image)
            DispatchQueue.global(qos: .userInteractive).async {
                do {
                    try handler.perform([request])
                } catch{
                    print("Error!")
                }
            }
        }
        
    }
}

