//
//  ViewController.swift
//  Maps App
//
//  Created by Yakup Acis on 8/16/22.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class MapsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationTxt: UITextField!
    @IBOutlet weak var noteTxt: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var selectedLatitude = Double()
    var selectedLongitude = Double()
    
    var selectedName = ""
    var selectedID : UUID?
    
    
    var annotationTitle = ""
    var annotationSubtitle = ""
    var annotationLatitude = Double()
    var annotationLongitude = Double()
    
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(selectLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 2
        mapView.addGestureRecognizer(gestureRecognizer)
        
        
        if selectedName != ""{
            // Core Data Get Data
            
            if let uuidString = selectedID?.uuidString{
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Location")
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                fetchRequest.returnsObjectsAsFaults = false
                
                do {
                    let results = try context.fetch(fetchRequest)
                    
                    if results.count > 0{
                        for result in results as! [NSManagedObject]{
                            
                            if let name = result.value(forKey: "name") as? String{
                                annotationTitle = name
                                if let note = result.value(forKey: "note") as? String{
                                    annotationSubtitle = note
                                    if let latitude = result.value(forKey: "latitude") as? Double{
                                        annotationLatitude = latitude
                                        if let longitude = result.value(forKey: "longitude") as? Double{
                                            annotationLongitude = longitude
                                            
                                            let annotation = MKPointAnnotation()
                                            annotation.title = annotationTitle
                                            annotation.subtitle = annotationSubtitle
                                            let coordinate = CLLocationCoordinate2D(latitude: annotationLatitude, longitude: annotationLongitude)
                                            annotation.coordinate = coordinate
                                            mapView.addAnnotation(annotation)
                                            locationTxt.text = annotationTitle
                                            noteTxt.text = annotationSubtitle
                                            
                                            locationManager.stopUpdatingLocation()
                                            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                            let region = MKCoordinateRegion(center: coordinate, span: span)
                                            mapView.setRegion(region, animated: true)
                                        }
                                    }
                                }
                            }
                        }
                    }
                } catch{
                    print("Error")
                }
                
            }
        }
        else{
            // Add New Data
        }
        
    }
    
    // Add Info Button on Annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        
        let reuseId = "myAnnotation"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        if pinView == nil{
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            pinView?.tintColor = .black
            let button = UIButton(type: .detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        }
        else{
            pinView?.annotation = annotation
        }
        
        return pinView
        
    }
    
    // Add Click to Info Button functions
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if selectedName != ""{
            
            let requestLocation = CLLocation(latitude: annotationLatitude, longitude: annotationLongitude)
            
            CLGeocoder().reverseGeocodeLocation(requestLocation) { (placemarkArray, error) in
                
                if let placemarks = placemarkArray{
                    if placemarks.count > 0{
                        
                        let newPlacemark = MKPlacemark(placemark: placemarks[0])
                        let item = MKMapItem(placemark: newPlacemark)
                        item.name = self.annotationTitle
                        
                        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                        
                        item.openInMaps(launchOptions: launchOptions)
                        
                    }
                }
            }
        }
    }
    
    @objc func selectLocation(gestureRecognizer : UILongPressGestureRecognizer){
        if gestureRecognizer.state == .began{
            if locationTxt.text != "" && noteTxt.text != ""{
                let touchPoint = gestureRecognizer.location(in: mapView)
                let touchCoordinat = mapView.convert(touchPoint, toCoordinateFrom: mapView)
                
                selectedLatitude = touchCoordinat.latitude
                selectedLongitude = touchCoordinat.longitude
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = touchCoordinat
                annotation.title = locationTxt.text
                annotation.subtitle = noteTxt.text
                mapView.addAnnotation(annotation)
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if selectedName == ""{
            let location = CLLocationCoordinate2DMake(locations[0].coordinate.latitude, locations[0].coordinate.longitude)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        }

    }
    
    @IBAction func saveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newLocation = NSEntityDescription.insertNewObject(forEntityName: "Location", into: context)
        
        newLocation.setValue(locationTxt.text, forKey:"name")
        newLocation.setValue(noteTxt.text, forKey:"note")
        newLocation.setValue(selectedLongitude, forKey: "longitude")
        newLocation.setValue(selectedLatitude, forKey: "latitude")
        newLocation.setValue(UUID(), forKey: "id")
    
        do {
            try context.save()
            print("Registered.")
        } catch{
            print("Error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newLocationCreated"), object: nil)
        navigationController?.popViewController(animated: true)
        
    }


}

