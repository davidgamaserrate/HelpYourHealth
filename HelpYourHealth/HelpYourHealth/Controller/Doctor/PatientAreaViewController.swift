//
//  PatientAreaViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 04/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit
import Blueprints

class PatientAreaViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images: [UIImage] = [#imageLiteral(resourceName: "medical.history"), #imageLiteral(resourceName: "medical.exams"), #imageLiteral(resourceName: "medical.record"), #imageLiteral(resourceName: "medical.medicines"), #imageLiteral(resourceName: "medical.thermometer")]
    var names: [String] = ["Histórico Médico", "Exames", "Laudos", "Medicamentos", "Sintomas"]
    var descriptions: [String] = ["Essa funcionalidade cria um histórico médico que pode ser atualizado constantemente e facilmente visualizado. Permitindo que cada um de seus médicos possam ler e atualizar sem a necessidade de refaze-lo como em uma folha impressa.", "Nessa aba você pode adicionar todos os tipos de exame através da câmera de seu celular, ou então importar imagens ou PDFs de seu diretório. Permite também uma visualização rápida e prática desses documentos.", "Nessa aba você pode escrever laudos de forma interativa clicando em adicionar laudos e preenchendo os campos necessários, após isso será gerado automaticamente um PDF com um modelo pronto, muito fácil, não? Ou então importar imagens ou PDFs de seu diretório. Permite também uma visualização rápida e prática desses documentos.", "Aqui tanto paciente quanto médicos podem adicionar um novo tipo de medicamento que essa sem usado pelo paciente. Clicando em adicionar medicamento e preenchendo os campo solicitados ele automaticamente cria para você lembretes, para lembra-lo de tomar seus remédios na hora certa e dentro de um determinado período de tempo.", "Com essa funcionalidade você tem a opção de anotar seus sintomas em um calendário para nunca mais ficar perdido durante uma consulta, auxiliando seu médico em seu diagnóstico."]
    var colors: [UIColor] = [.systemBlue, #colorLiteral(red: 0.3831424117, green: 0.7302771807, blue: 0.2767491341, alpha: 1), .systemPink, .systemOrange, .systemRed]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let width = self.collectionView.frame.width
        
        let layout = VerticalBlueprintLayout(itemsPerRow: (width / 162).rounded(), height: 205, minimumInteritemSpacing: 10, minimumLineSpacing: 10, sectionInset: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20), stickyHeaders: false, stickyFooters: false)
        self.collectionView.collectionViewLayout = layout
    }
}

extension PatientAreaViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
}

public class PatientAreaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageFunc: UIImageView!
    @IBOutlet weak var titleFunc: UILabel!
    @IBOutlet weak var descriptionFunc: UILabel!
}
