//
//  ArticlesTableViewCell.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/15/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var articleImgView: UIImageView!
    @IBOutlet weak var articleExtraLbl: UILabel!
    @IBOutlet weak var articleTitleTxt: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
