//
//  DashboardViewController.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/9/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var iconArray = [UIImage(named:"schedule"), UIImage(named:"second")]
    
    var destinations = [ScheduleViewController(), MapViewController()]
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
