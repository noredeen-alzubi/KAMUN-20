//
//  DashboardViewController.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/9/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//
import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

var locationsOnMap = [
    "King Hussein bin Talal Humanities Wing": [31.751899,35.848381],
    "Michael Dagher Science Wing": [31.751776,35.847919],
    "Lecture Hall": [31.751343,35.847804],
    "Abdul Majeed Shoman Auditorium": [31.750937,35.846385],
    "Arab Bank Administration Building": [31.750865,35.846937],
    "Mohammed Thunayan Al-Ghanim Faculty Center":[31.751452,35.847496],
    "HH Sheikh Mohammed bin Rashid Al Maktoum Library": [31.751758,35.847052],
    "Rotunda": [31.752033,35.846928],
    "Isam and Rajai Salfiti Fine and Performing Arts Wing": [31.751249,35.847301],
    "Gallery": [31.751288,35.846971],
    "Middle School Building": [31.751710, 35.846038],
    "Clock Tower": [31.751467,35.846634],
    "The Hess Family Dining Hall": [31.752743,35.848438],
    "New Dining Hall": [31.753287, 35.849278],
    "The Saad Rafic Hariri Athletic Center": [31.754829, 35.847826],
    "Ras Al Asad Health Center": [31.753152, 35.844887],
    "Middle School Parking": [31.751219, 35.844600],
    "Student Union": [31.752457, 35.847669],
    "King Abdullah II Spiritual Center": [31.752015, 35.848692]
]

class DashboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var weatherImgView: UIImageView!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var loadingView: NVActivityIndicatorView!
    @IBOutlet weak var DoSView: UIView!
    
    
        
    
    var iconArray = [UIImage(named:"schedule"), UIImage(named:"map"), UIImage(named:"locations")]
    
    var destinations = [ScheduleViewController(), MapViewController()]
    
    let weather_key = "dcb1fae3f28fcf9637702ab46ba595a6"
    
    let lat = 31.752529
    let long = 35.846844
   

    override func viewDidLoad() {
        
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        self.loadingView.startAnimating()
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        
        

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func touch(_ sender: UITapGestureRecognizer) {
        
        self.performSegue(withIdentifier: "dos", sender: sender)
    }
    
    func setupCards(){
        self.DoSView.layer.cornerRadius = 8
        self.DoSView.layer.shadowColor = UIColor.black.cgColor
        self.DoSView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.DoSView.layer.shadowRadius = 5
        self.DoSView.layer.shadowOpacity = 0.7
        self.DoSView.backgroundColor = UIColor.clear

        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.red.cgColor, UIColor.gray.cgColor]
        gradient.startPoint = CGPoint(x: 1, y: 1)
        gradient.endPoint = CGPoint(x: 0, y: 0)
        gradient.locations = [0,1]
        gradient.frame = self.DoSView.bounds
        gradient.cornerRadius = 8
        
        let c1_light = #colorLiteral(red: 0.9411764741, green: 0.6022757507, blue: 0.1156194169, alpha: 1)
        let c2_dark = #colorLiteral(red: 0.7725490196, green: 0.007843137255, blue: 0.02352941176, alpha: 1)
        
        gradient.colors = [c1_light.cgColor,
                           c2_dark.cgColor]

       
        self.DoSView.layer.insertSublayer(gradient, at: 0)
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupCards()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        self.navigationController?.isNavigationBarHidden = true
        
        AF.request("http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(weather_key)").responseJSON {
            response in
            print(response.result)
            if let responseStr = response.value{
                 //print(responseStr)
                let JSONResponse = JSON(responseStr)
                let JSONWeather = JSONResponse["weather"].array![0]
                let JSONTemp = JSONResponse["main"]
                let iconName = JSONWeather["icon"].stringValue
                
                //setters
                self.loadingView.stopAnimating()
                self.weatherImgView.image = UIImage(named: iconName)
                self.tempLbl.text = "\(Int(round(JSONTemp["temp"].doubleValue - 273.15)))"
                
                
            }
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(iconArray.count)
        return iconArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCollectionViewCell", for: indexPath) as! DashboardCollectionViewCell
        
        cell.configureCell(image: iconArray[indexPath.row]!)
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 4, height: 4)
        cell.layer.shadowRadius = 6.0
        cell.layer.shadowOpacity = 0.75
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        /*Tap.on(view: cell.roundedView){
            //array of destinations
            self.navigationController?.pushViewController(self.destinations[indexPath.row], animated: true)
            
        }*/
        
        cell.btnTapAction = {
            () in
            print("Edit tapped in cell", indexPath)
            // start your edit process here...
            let segue = "Segue" + String(indexPath.row)
            self.performSegue(withIdentifier: segue, sender:self)
        }
        
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "Segue1":
            if let destVC = segue.destination as? ScheduleViewController {
                // Set the properties that need to be set in destVC
                
            }
        case "Segue2":
            if let destVC = segue.destination as? MapViewController {
                // Set the properties that need to be set in destVC
                
            }
            
        default: break
        }
        
    }
    
   
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: self.collectionView.frame.height * 0.73, height: self.collectionView.frame.height * 0.73)
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
