//
//  ArticleDetailViewController.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/19/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var articleImg: UIImageView!
    @IBOutlet weak var articleAuthor: UILabel!
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleBody: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
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
