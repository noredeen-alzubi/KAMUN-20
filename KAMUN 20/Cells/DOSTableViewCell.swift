//
//  DOSTableViewCell.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/23/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit

class DOSTableViewCell: UITableViewCell {
    
    @IBOutlet weak var forumLbl: UILabel!
    @IBOutlet weak var delegateImg: UIImageView!
    @IBOutlet weak var delegateName: UILabel!
    
    
    
    
    @IBOutlet weak var shadowLayer: ShadowView!
    @IBOutlet weak var mainBackground: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.layoutMargins = UIEdgeInsets.zero
//        self.contentView.layoutMargins.left = 20
        self.mainBackground.layer.cornerRadius = 8
        delegateImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
        delegateImg.sd_imageIndicator = SDWebImageProgressIndicator.`default`
        self.mainBackground.layer.masksToBounds = true
        self.shadowLayer.layer.cornerRadius = 8
        self.shadowLayer.layer.masksToBounds = false
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func updateContent(delegate: DOS){
        forumLbl.text = delegate.forum
        delegateName.text = delegate.name
        delegateImg.sd_setImage(with: URL(string: delegate.imageURL), placeholderImage:
            UIImage(named: "default-placeholder"), options: [ .continueInBackground],
         completed: { (image: UIImage?, error: Error?, cachetype: SDImageCacheType,
        imageURL: URL?) in
               })
    }

}
