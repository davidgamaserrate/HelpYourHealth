//
//  PersonalDataViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 07/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit
import CenteredCollectionView

class PersonalDataViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var names: [String] = ["Rafael Escaleira", "Mariane Mori"]
    var ages: [String] = ["20", "18"]
    var phones: [String] = ["(67) 98188-4499", "(67) 9600-4859"]
    
    var centeredCollectionViewFlowLayout: CenteredCollectionViewFlowLayout!
    var controllers: [UIViewController?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.controllers.append((storyboard.instantiateViewController(identifier: "BasicInformationViewController") as? BasicInformationViewController))
        self.controllers.append((storyboard.instantiateViewController(identifier: "ContactViewController") as? ContactViewController))
        self.controllers.append((storyboard.instantiateViewController(identifier: "SupplementaryDataViewController") as? SupplementaryDataViewController))
        self.controllers.append((storyboard.instantiateViewController(identifier: "AddressViewController") as? AddressViewController))
        self.controllers.append((storyboard.instantiateViewController(identifier: "DependenciesViewController") as? DependenciesViewController))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        centeredCollectionViewFlowLayout = collectionView.collectionViewLayout as? CenteredCollectionViewFlowLayout
        
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        centeredCollectionViewFlowLayout.itemSize = CGSize(
            
            width: self.collectionView.frame.width - 40,
            height: self.collectionView.frame.height - 40
        )
        
        centeredCollectionViewFlowLayout.minimumLineSpacing = 10
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
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

extension PersonalDataViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.controllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonalDataCollectionViewCell", for: indexPath) as? PersonalDataCollectionViewCell else { return UICollectionViewCell() }
    
        if indexPath.row == self.controllers.count - 1 {
            
            (self.controllers[indexPath.row] as? DependenciesViewController)?.tableViewDelegate = self
            (self.controllers[indexPath.row] as? DependenciesViewController)?.tableViewDatasource = self
        }
        
        cell.backgroundView = self.controllers[indexPath.row]?.view
        cell.addSubview(cell.backgroundView ?? UIView())
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let currentCenteredPage = centeredCollectionViewFlowLayout.currentCenteredPage
        
        if currentCenteredPage != indexPath.row {
            
            centeredCollectionViewFlowLayout.scrollToPage(index: indexPath.row, animated: true)
        }
    }
}

public class PersonalDataCollectionViewCell: UICollectionViewCell {
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        self.removeFromSuperview()
    }
}

extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
