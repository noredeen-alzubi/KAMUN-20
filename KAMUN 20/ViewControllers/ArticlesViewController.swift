//
//  ArticlesViewController.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/15/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var articles: [Article] = [Article]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticlesTableViewCell
        let eachArticle = articles[indexPath.row]
        cell?.articleExtraLbl.text = eachArticle.author
        cell?.articleImgView.image = eachArticle.image.image
        cell?.articleTitleTxt.text = eachArticle.title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
         // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        //testing
        articles.append(Article(title: "BREAKING NEWS: Delegates start war in HCC. BREAKING NEWS:w", author: "Abook Al-Zu'bi", text: "awdwadwadawda", image: UIImage(named: "ip")!))
        //testing
        
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 259
        
       
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
