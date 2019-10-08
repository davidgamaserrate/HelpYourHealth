//
//  AddressViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 07/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
    
    @IBOutlet weak var cepTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var supplementTextField: UITextField!
    @IBOutlet weak var neighborhoodTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setPaddingTextFields(textFields: [self.cepTextField, self.streetTextField, self.numberTextField, self.supplementTextField, self.neighborhoodTextField], paddings: [10, 10, 5, 5, 5])
    }
    
    private func setPaddingTextFields(textFields: [UITextField], paddings: [CGFloat]) {
        
        for index in 0 ... textFields.count - 1 {
            
            textFields[index].setLeftPaddingPoints(paddings[index])
            textFields[index].setRightPaddingPoints(paddings[index])
        }
    }
}
