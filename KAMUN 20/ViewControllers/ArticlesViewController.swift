//
//  ArticlesViewController.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/15/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit
import Firebase

class ArticlesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var articles: [Article] = [Article]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticlesTableViewCell
        let eachArticle = articles[indexPath.row]
//        cell?.articleExtraLbl.text = eachArticle.author
//        cell?.articleImgView.image = eachArticle.image.image
//        cell?.articleTitleTxt.text = eachArticle.title
        cell?.updateContent(article: eachArticle)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
         // Do any additional setup after loading the view.
        super.viewDidLoad()
        
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 259
        
        setUpConnections()
        
    }
    
    func setUpConnections(){
           Database.database().reference().child("articles").observe(.childAdded, with: { snapshot in
               
               let dictArticle = snapshot.value as? [String:AnyObject] ?? [:]
               
              
               print(snapshot.key)
               self.articles.insert(Article(dictionary: dictArticle, id: snapshot.key), at: 0)
               self.tableView.separatorColor = UITableView().separatorColor
               self.tableView.reloadData()
               
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
