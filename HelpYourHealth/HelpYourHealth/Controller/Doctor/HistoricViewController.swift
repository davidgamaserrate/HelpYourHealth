//
//  HistoricViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 06/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit
import Blueprints

class HistoricViewController: UIViewController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images: [UIImage] = [#imageLiteral(resourceName: "personal.data"), #imageLiteral(resourceName: "anamnesis"), #imageLiteral(resourceName: "family.history"), #imageLiteral(resourceName: "occupational.background")]
    var names: [String] = ["Dados Pessoais", "Anamnese", "Antecedentes Familiares", "Antecedentes Ocupacionais"]
    var descriptions: [String] = ["Toda informação relacionada a uma pessoa e que permite identificá-la, ou seja, permite saber sobre sua real existência.", "Histórico de todos os sintomas narrados pelo paciente sobre os casos clínicos", "Todo o historial de doenças ou condições que tenham afetado os parentes por consanguinidade do paciente.", "Acidentes no trabalho, desenvolvimento de atividades manuais, ..."]
    var colors: [UIColor] = [.systemBlue, #colorLiteral(red: 0.3831424117, green: 0.7302771807, blue: 0.2767491341, alpha: 1), .systemPink, .systemOrange]
    
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
    
    @IBAction func unwindToHistoric(segue: UIStoryboardSegue) {

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let width = self.collectionView.frame.width
        
        let layout = VerticalBlueprintLayout(itemsPerRow: (width / 162).rounded(.down), height: 215, minimumInteritemSpacing: 10, minimumLineSpacing: 10, sectionInset: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20), stickyHeaders: false, stickyFooters: false)
        self.collectionView.collectionViewLayout = layout
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
            
            self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        }
    }
}

extension HistoricViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PatientAreaCollectionViewCell", for: indexPath) as? PatientAreaCollectionViewCell else { return UICollectionViewCell() }
        
        cell.imageFunc.image = self.images[indexPath.row]
        cell.titleFunc.text = self.names[indexPath.row]
        cell.descriptionFunc.text = self.descriptions[indexPath.row]
        cell.imageFunc.tintColor = self.colors[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 { DispatchQueue.main.async { self.performSegue(withIdentifier: "PersonalDataViewController", sender: self) } }
    }
}
