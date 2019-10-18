//
//  OccupationalBackgroundViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 09/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit

class OccupationalBackgroundViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var questions: [String] = ["Já sofreu algum acidente de trabalho", "Já sofreu de doença do trabalho ou profissional", "Afastou-se do trabalho por período superior a 15 dias por acidente ou doença do trabalho", "Desenvolve atividades manuais (tricô, pintura, artesanato)", "Toca algum instrumento musical", "Suas condições de saúde atuais promovem alguma limitação para o trabalho", "Atividades anteriores"]
    var isYes: [Bool] = [false, false, false, false, false, false, false]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    @IBAction func backButtonAction() { self.navigationController?.popViewController(animated: true) }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer {
            return true
        }
        
        return false
    }
}

extension OccupationalBackgroundViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnamnesisTableViewCell", for: indexPath) as? AnamnesisTableViewCell else { return UITableViewCell() }
        
        cell.nameLabel.text = self.questions[indexPath.row]
        cell.isYes.tag = indexPath.row
        cell.isYes.isOn = self.isYes[indexPath.row]
        cell.isYes.addTarget(self, action: #selector(self.switchAction(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func switchAction(_ sender: UISwitch) {
        
        self.isYes[sender.tag] = sender.isOn
    }
}
