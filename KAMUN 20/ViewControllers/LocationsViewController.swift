//
//  LocationsViewController.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/15/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit
import Firebase

class LocationsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var ref : DatabaseReference!
    
    var handleAdded: DatabaseHandle!
    var handleRemoved: DatabaseHandle!
    var handleChanged: DatabaseHandle!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = view as? UILabel ?? UILabel()
        label.font = UIFont.init(name: "Open Sans", size: 25)
        label.textColor = .black
        label.textAlignment = .center
        label.text = pickerData[row]
        return label
    }
    
    
    @IBOutlet weak var btnLoc: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var btnMap: UIButton!
    @IBOutlet weak var mainLocText: UILabel!
    
    var pickerData: [String] = [String]()
    var locations : [Location] = [Location]()
    public var selectedLoc: String = ""
       
    @IBAction func btnLocClicked(_ sender: Any) {
        
        btnMap.isEnabled = false
        
        if (locations.count == 0){
            
            let alert = UIAlertController(title: "Network Error", message: "We're having trouble loading the locations data.", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "Ok",
                style: .default,
                handler: nil) //You can use a block here to handle a press on this button

            alert.addAction(actionOk)
            self.present(alert, animated: true)
            
        }else{
            
            let location = locations[indexOf(forum: self.pickerData[self.picker.selectedRow(inComponent: 0)])]
            self.mainLocText.text = location.room + " - " + location.building
            self.selectedLoc = location.building
            //enable button
            self.btnMap.isEnabled = true
            self.btnMap.isHidden = false
        }
        
        
        
        
        
    }
    
    @IBAction func showMapClicked(_ sender: Any) {
   
        self.performSegue(withIdentifier: "ShowMapSegue", sender: nil)
    
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.btnLoc.backgroundColor = UIColor.lightGray
        self.navigationController?.isNavigationBarHidden = false
               self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
               self.navigationController?.navigationBar.shadowImage = UIImage()
               self.navigationController?.navigationBar.isTranslucent = true
               self.navigationController?.view.backgroundColor = UIColor.clear
        
        
        
        
        pickerData = ["Security Council", "Disarmament Commission", "Human Rights Council", "General Assembly 1", "General Assembly 2", "Economic and Financial Council", "Environmental and Social Council", "World Health Organization", "International Court of Justice", "International Criminal Court", "Historical Criminal Court", "United States Congress", "East Asia Summit", "Crisis Team", "Arab League"]
        
        ref = Database.database().reference().child("locations")
        
        handleAdded = ref.observe(.childAdded, with: { snapshot in
            
            let dictLocation = snapshot.value as? [String:AnyObject] ?? [:]
            //let dictArticles = root["articles"] as? [String : AnyObject] ?? [:]
            
            self.locations.insert(Location(forum: snapshot.key, dictionary: dictLocation), at: 0)
            
            if self.locations.count >= 7{
                //enable function + stop loading
                self.btnLoc.isEnabled = true
                self.btnLoc.backgroundColor = UIColor(red: 215/255, green: 255/255, blue: 189/255, alpha: 1)
            
            }
        
        })
        
        
        handleChanged = ref.observe(.childChanged, with: { snapshot in
                   let dictLocation = snapshot.value as? [String:AnyObject] ?? [:]
                   
                   self.locations[self.indexOf(forum: snapshot.key)] = Location(forum: snapshot.key, dictionary: dictLocation)
                   
               })
        
        // Do any additional setup after loading the view.
    }
    
    func indexOf(forum: String) -> Int{
           for i in 0..<locations.count{
               if(locations[i].forum == forum){
                   return i;
               }
           }
           return -1
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepping")
        if(segue.identifier == "ShowMapSegue"){
            
            let receiverVC = segue.destination as! MapViewController
            print(selectedLoc)
            receiverVC.segueLocation = locationsOnMap[selectedLoc]!
            
        }
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
