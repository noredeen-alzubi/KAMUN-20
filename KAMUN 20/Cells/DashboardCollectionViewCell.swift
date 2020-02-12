//
//  DashboardCollectionViewCell.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/9/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import UIKit

class DashboardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageButton: UIImageView!
    @IBOutlet weak var roundedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        roundedView.layer.cornerRadius = 7
        roundedView.layer.masksToBounds = true
        //button.centerVertically()
    }
    
    
    class var reuseIdentifier: String {
        return "DashboardCollectionViewCell"
    }
    class var nibName: String {
        return "DashboardCollectionViewCell"
    }
    
    func configureCell(image: UIImage) {
        imageButton.image = image
    }
    
    
}
