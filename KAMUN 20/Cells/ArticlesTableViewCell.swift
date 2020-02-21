//
//  ArticlesTableViewCell.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/15/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit



class ArticlesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var articleExtraLbl: UILabel!
    @IBOutlet weak var articleTitleTxt: UILabel!
    @IBOutlet weak var articleImgView: UIImageView!
    
   /* var article: Article?{
        didSet {
            
            articleImgView.image = nil
            
            if let imageURL = article?.imageURL {
                
                
            }
            
        }
    }*/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        articleImgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        articleImgView.sd_imageIndicator = SDWebImageProgressIndicator.`default`

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func updateContent(article: Article){
        articleExtraLbl.text = article.author
        articleTitleTxt.text = article.title
        articleImgView.sd_setImage(with: URL(string: article.imageURL), placeholderImage:
            UIImage(named: "default-placeholder"), options: [ .continueInBackground],
         completed: { (image: UIImage?, error: Error?, cachetype: SDImageCacheType,
        imageURL: URL?) in
               })
    }

}
