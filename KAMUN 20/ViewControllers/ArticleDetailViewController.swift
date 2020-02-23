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
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var articleAuthor: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleBody: UITextView!
    
    
    
    var text_: String = String()
    var title_: String = String()
    var author_: String = String()
    var date_: String = String()
    var image_: UIImage = UIImage()
    var loadedImage: Bool = false
    var url_: String = String()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    overrideUserInterfaceStyle = .light
        
        articleAuthor.text = author_
        articleDate.text = date_
        articleTitle.text = title_
        articleDate.text = date_
        articleBody.text = text_

        if(loadedImage){
            articleImg.image = image_
        }else{
            articleImg.sd_setImage(with: URL(string: url_), placeholderImage:
                UIImage(named: "default-placeholder"), options: [ .continueInBackground],
             completed: { (image: UIImage?, error: Error?, cachetype: SDImageCacheType,
            imageURL: URL?) in

                   })
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
