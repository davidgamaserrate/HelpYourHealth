//
//  PatientAreaViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 04/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit
import Blueprints

class PatientAreaViewController: UIViewController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images: [UIImage] = [#imageLiteral(resourceName: "medical.history"), #imageLiteral(resourceName: "medical.diagnosis"), #imageLiteral(resourceName: "medical.exams"), #imageLiteral(resourceName: "medical.record"), #imageLiteral(resourceName: "medical.medicines"), #imageLiteral(resourceName: "medical.thermometer")]
    var names: [String] = ["Histórico Médico", "Diagnóstico", "Exames", "Laudos", "Medicamentos", "Sintomas"]
    var descriptions: [String] = ["Essa funcionalidade cria um histórico médico que pode ser atualizado constantemente e facilmente visualizado. Permitindo que cada um de seus médicos possam ler e atualizar sem a necessidade de refaze-lo como em uma folha impressa.", "Com a função de diagnósticos os médicos conseguem gerar diagnósticos de forma interativa, esse documentos podem ser visualizados por outros médicos, porem editados  apenas pelos mesmos. Essa informações podem ser extremamente uteis em consultas futuras.", "Nessa aba você pode adicionar todos os tipos de exame através da câmera de seu celular, ou então importar imagens ou PDFs de seu diretório. Permite também uma visualização rápida e prática desses documentos.", "Nessa aba você pode escrever laudos de forma interativa clicando em adicionar laudos e preenchendo os campos necessários, após isso será gerado automaticamente um PDF com um modelo pronto, muito fácil, não? Ou então importar imagens ou PDFs de seu diretório. Permite também uma visualização rápida e prática desses documentos.", "Aqui tanto paciente quanto médicos podem adicionar um novo tipo de medicamento que essa sem usado pelo paciente. Clicando em adicionar medicamento e preenchendo os campo solicitados ele automaticamente cria para você lembretes, para lembra-lo de tomar seus remédios na hora certa e dentro de um determinado período de tempo.", "Com essa funcionalidade você tem a opção de anotar seus sintomas em um calendário para nunca mais ficar perdido durante uma consulta, auxiliando seu médico em seu diagnóstico."]
    var colors: [UIColor] = [.systemBlue, #colorLiteral(red: 0.3831424117, green: 0.7302771807, blue: 0.2767491341, alpha: 1), .systemPink, .systemOrange, .systemRed, .systemIndigo]

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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let width = self.collectionView.frame.width
        
        let layout = VerticalBlueprintLayout(itemsPerRow: (width / 162).rounded(.down), height: 185, minimumInteritemSpacing: 10, minimumLineSpacing: 10, sectionInset: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20), stickyHeaders: false, stickyFooters: false)
        self.collectionView.collectionViewLayout = layout
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            
            self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            DispatchQueue.main.async { self.performSegue(withIdentifier: "HistoricViewController", sender: self) }
        }
    }
}

public class PatientAreaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageFunc: UIImageView!
    @IBOutlet weak var titleFunc: UILabel!
    @IBOutlet weak var descriptionFunc: UILabel!
}
