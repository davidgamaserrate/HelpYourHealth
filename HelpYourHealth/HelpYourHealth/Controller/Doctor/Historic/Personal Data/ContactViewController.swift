//
//  ContactViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 07/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit
import M13Checkbox

class ContactViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cellPhoneTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var otherPhoneTextField: UITextField!
    @IBOutlet weak var checkBoxEmail: UIView!
    @IBOutlet weak var checkBoxMessage: UIView!
    
    let emailBox = M13Checkbox(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
    let messageBox = M13Checkbox(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.emailTextField.setLeftPaddingPoints(10)
        self.emailTextField.setRightPaddingPoints(10)
        
        self.cellPhoneTextField.setLeftPaddingPoints(10)
        self.cellPhoneTextField.setRightPaddingPoints(10)
        
        self.phoneTextField.setLeftPaddingPoints(5)
        self.phoneTextField.setRightPaddingPoints(5)
        
        self.otherPhoneTextField.setLeftPaddingPoints(5)
        self.otherPhoneTextField.setRightPaddingPoints(5)
        
        self.checkBoxEmail.addSubview(self.emailBox)
        self.checkBoxMessage.addSubview(self.messageBox)
        
        self.buildCheckBox(checkBox: self.emailBox)
        self.buildCheckBox(checkBox: self.messageBox)
    }
    
    private func buildCheckBox(checkBox: M13Checkbox) {
        
        checkBox.stateChangeAnimation = .spiral
        checkBox.animationDuration = 0.8
        checkBox.tintColor = .systemPink
        checkBox.boxLineWidth = 3
        checkBox.checkmarkLineWidth = 3
    }
}
