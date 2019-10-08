//
//  DependenciesViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 07/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit

class DependenciesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewDelegate: UITableViewDelegate!
    var tableViewDatasource: UITableViewDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        self.tableView.delegate = self.tableViewDelegate
        self.tableView.dataSource = self.tableViewDatasource
        
        self.tableView.reloadData()
    }
}

extension PersonalDataViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DependenciesTableViewCell", for: indexPath) as? DependenciesTableViewCell else { return UITableViewCell() }
        
        cell.nameLabel.text = self.names[indexPath.row]
        cell.ageLabel.text = self.ages[indexPath.row]
        cell.moreLabel.text = self.phones[indexPath.row]
        
        return cell
    }
}

public class DependenciesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var moreLabel: UILabel!
}
