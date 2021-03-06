//
//  ScheduleViewController.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/12/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit
import Firebase
import NVActivityIndicatorView

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBAction func valChanged(_ sender: Any) {
        
        if days.count == 3 {
            self.tableView.reloadData()
        }
        
        
    }
    
    
    @IBOutlet weak var loadingView: NVActivityIndicatorView!
    
    
    var days: [[String:AnyObject]] = [[String:AnyObject]]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(segmentedControl.selectedSegmentIndex)
        print(days.count)
        if(days.count == 3){
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
        
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        self.loadingView.startAnimating()
        self.tableView.separatorStyle = .none
        
        overrideUserInterfaceStyle = .light
        
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 49
        
        Database.database().reference().child("schedule").observe(.childAdded, with: { snapshot in
            
            let dictSchedule = snapshot.value as? [String:AnyObject] ?? [:]
            self.days.append(dictSchedule)
            self.loadingView.stopAnimating()
            
            self.tableView.separatorStyle = .singleLine

            self.tableView.reloadData()
            
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
