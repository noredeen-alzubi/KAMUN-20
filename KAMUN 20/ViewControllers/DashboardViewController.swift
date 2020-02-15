//
//  DashboardViewController.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/9/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit

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
    
    
    var iconArray = [UIImage(named:"schedule"), UIImage(named:"second"), UIImage(named:"second")]
    
    var destinations = [ScheduleViewController(), MapViewController()]
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        self.navigationController?.isNavigationBarHidden = true
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
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
