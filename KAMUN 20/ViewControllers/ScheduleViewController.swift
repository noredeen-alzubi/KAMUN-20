//
//  ScheduleViewController.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/12/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit
import Firebase
class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBAction func valChanged(_ sender: Any) {
        self.tableView.reloadData()
        
    }
    
    var days: [[String:AnyObject]] = [[String:AnyObject]]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(segmentedControl.selectedSegmentIndex)
        if(days.count > 0){
            let daySchedule: [String:AnyObject] = days[segmentedControl.selectedSegmentIndex]
                   return daySchedule.count
        }else{
            return 0
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSchedule", for: indexPath) as? ScheduleTableViewCell
        
         let daySchedule: [String:AnyObject] = days[segmentedControl.selectedSegmentIndex]
        
        let sortedKeys: [String] = Array(daySchedule.keys).sorted(by: <) // ["A", "D", "Z"]
        
        cell?.timeLbl.text = sortedKeys[indexPath.row]
        cell?.eventLbl.text = daySchedule[sortedKeys[indexPath.row]] as? String
        
        
        
        return cell!
        
    }
    

    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 49
        
        Database.database().reference().child("schedule").observe(.childAdded, with: { snapshot in
            
            let dictSchedule = snapshot.value as? [String:AnyObject] ?? [:]
            self.days.append(dictSchedule)
            self.tableView.reloadData()

            print("ss")
            
        })
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
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
