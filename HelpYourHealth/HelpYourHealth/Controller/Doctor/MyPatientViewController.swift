//
//  MyPatientViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 04/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit

class MyPatientViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var names: [String] = ["Murilo Arelhano", "Rafael Escaleira", "Mariane Mori"]
    var ages: [String] = ["17", "20", "18"]
    var phones: [String] = ["(18) 99740-5083", "(67) 98188-4499", "(67) 9600-4859"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.backgroundImage = UIImage()
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    }
}

extension MyPatientViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPatientTableViewCell", for: indexPath) as? MyPatientTableViewCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        cell.nameLabel.text = self.names[indexPath.row]
        cell.ageLabel.text = self.ages[indexPath.row]
        cell.phoneLabel.text = self.phones[indexPath.row]
        
        return cell
    }
}

public class MyPatientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
}
