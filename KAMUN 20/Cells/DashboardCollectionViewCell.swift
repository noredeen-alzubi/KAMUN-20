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
    @IBOutlet weak var cellButton: UIButton!
    
     var btnTapAction : (()->())?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        roundedView.layer.cornerRadius = 12
        roundedView.layer.masksToBounds = true
        cellButton.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
       
    }
    
    @objc func btnTapped() {
        print("Tapped!")
        
        // use our "call back" action to tell the controller the button was tapped
        btnTapAction?()
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
