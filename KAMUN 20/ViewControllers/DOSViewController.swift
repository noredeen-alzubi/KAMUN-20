//
//  DOSViewController.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/23/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit
import Firebase

class DOSViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var delegates: [DOS] = [DOS]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DOScell", for: indexPath) as? DOSTableViewCell
        let eachDOS = delegates[indexPath.row]
        cell?.updateContent(delegate: eachDOS)
        cell?.layer.cornerRadius = 8
        cell?.clipsToBounds = true
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 320
        overrideUserInterfaceStyle = .light
       // self.loadingVIew.startAnimating()
        //self.tableView.separatorStyle = .none

        setUpConnections()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
               self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
               self.navigationController?.navigationBar.shadowImage = UIImage()
               self.navigationController?.navigationBar.isTranslucent = true
               self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    func setUpConnections(){
        Database.database().reference().child("delegates").observe(.childAdded, with: { snapshot in
            
            let dictDOS = snapshot.value as? [String:AnyObject] ?? [:]
            
           
            print(snapshot.key)
            self.delegates.insert(DOS(dictionary: dictDOS, id: snapshot.key), at: 0)
            self.tableView.separatorColor = UITableView().separatorColor
            self.tableView.reloadData()
            
         //self.loadingVIew.stopAnimating()
         self.tableView.separatorStyle = .singleLine

            
        })
        
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
