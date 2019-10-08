//
//  SupplementaryDataViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 07/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit

class SupplementaryDataViewController: UIViewController {
    
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var rgTextField: UITextField!
    @IBOutlet weak var emitterTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var professionTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setPaddingTextFields(textFields: [self.cpfTextField, self.rgTextField, self.emitterTextField, self.weightTextField, self.heightTextField, self.professionTextField], paddings: [10, 5, 5, 5, 5, 10])
    }
    
    private func setPaddingTextFields(textFields: [UITextField], paddings: [CGFloat]) {
        
        for index in 0 ... textFields.count - 1 {
            
            textFields[index].setLeftPaddingPoints(paddings[index])
            textFields[index].setRightPaddingPoints(paddings[index])
        }
    }
}
