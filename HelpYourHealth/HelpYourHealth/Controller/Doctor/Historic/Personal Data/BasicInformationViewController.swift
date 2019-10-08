//
//  BasicInformationViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 07/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit
import M13Checkbox

class BasicInformationViewController: UIViewController {
    
    @IBOutlet weak var completeNameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var checkBoxMale: UIView!
    @IBOutlet weak var checkBoxFemale: UIView!
    
    let maleBox = M13Checkbox(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
    let femaleBox = M13Checkbox(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.completeNameTextField.setLeftPaddingPoints(10)
        self.completeNameTextField.setRightPaddingPoints(10)
        
        self.dateOfBirthTextField.setLeftPaddingPoints(10)
        self.dateOfBirthTextField.setRightPaddingPoints(10)
        
        self.ageLabel.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 12)
        
        self.checkBoxMale.addSubview(self.maleBox)
        self.checkBoxFemale.addSubview(self.femaleBox)
        
        self.buildCheckBox(checkBox: self.maleBox)
        self.buildCheckBox(checkBox: self.femaleBox)
    }
    
    private func buildCheckBox(checkBox: M13Checkbox) {
        
        checkBox.stateChangeAnimation = .spiral
        checkBox.animationDuration = 0.8
        checkBox.tintColor = .systemPink
        checkBox.boxLineWidth = 3
        checkBox.checkmarkLineWidth = 3
    }
}
