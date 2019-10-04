//
//  ProfileViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 04/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var informationView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.profileImage.roundCorners(corners: [.allCorners], radius: self.profileImage.frame.size.width)
        self.backgroundImage.roundCorners(corners: [.topRight, .topLeft], radius: 20)
        self.informationView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20)
        
    }
}
