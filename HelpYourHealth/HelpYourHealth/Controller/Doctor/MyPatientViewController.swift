//
//  MyPatientViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 04/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit
import Blueprints

class MyPatientViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var names: [String] = ["Murilo Arelhano", "Rafael Escaleira", "Mariane Mori"]
    var ages: [String] = ["17", "20", "18"]
    var phones: [String] = ["(18) 99740-5083", "(67) 98188-4499", "(67) 9600-4859"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.backgroundImage = UIImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let width = self.collectionView.frame.width
        
        let layout = VerticalBlueprintLayout(itemsPerRow: (width / 335).rounded(), height: 160, minimumInteritemSpacing: 10, minimumLineSpacing: 10, sectionInset: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20), stickyHeaders: false, stickyFooters: false)
        self.collectionView.collectionViewLayout = layout
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            
            self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        }
    }
}

extension MyPatientViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPatientCollectionViewCell", for: indexPath) as? MyPatientCollectionViewCell else { return UICollectionViewCell() }
        
        cell.nameLabel.text = self.names[indexPath.row]
        cell.ageLabel.text = self.ages[indexPath.row]
        cell.phoneLabel.text = self.phones[indexPath.row]
        
        return cell
    }
}

public class MyPatientCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
}
