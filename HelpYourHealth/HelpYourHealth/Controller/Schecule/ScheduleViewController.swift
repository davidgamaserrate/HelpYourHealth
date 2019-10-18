//
//  ScheduleViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 08/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func websiteAction() {
        
        guard let url = URL(string: "https://helpyourhealth.com.br") else { return }
        UIApplication.shared.open(url)
    }
}
