//
//  FamilyHistoryViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 09/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit

class FamilyHistoryViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var diseases: [String] = ["Diabetes", "Surdez", "Doenças do Coração", "Alcoolismo", "Pressão Alta", "Tuberculose Pulmonar", "Câncer", "Asma", "Depressão", "Alergia"]
    var desciptionDiseases: [String] = ["Diabetes é uma doença causada pela produção insuficiente ou má absorção de insulina, hormônio que regula a glicose no sangue e garante energia para o organismo. A insulina é um hormônio que tem a função de quebrar as moléculas de glicose(açúcar) transformando-a em energia para manutenção das células do nosso organismo.", "Surdez é o nome dado à impossibilidade ou dificuldade de ouvir. A audição é constituída por um sistema de canais que conduz o som até o ouvido interno, onde essas ondas são transformadas em estímulos elétricos que são enviados ao cérebro, órgão responsável pelo reconhecimento e identificação daquilo que ouvimos.", "O coração é o órgão central do sistema circulatório, sendo responsável pelo contínuo bombeamento de sangue através dos vasos sanguíneos. Seu correto funcionamento é essencial para a manutenção da vida, uma vez que é através do sangue que todos os tecidos corporais recebem nutrientes e oxigênio. Condições médicas relacionadas ao coração são consideradas gravíssimas, causando a morte de milhões de pessoas por ano, e devem receber tratamento imediato.", "Alcoolismo é a dependência do indivíduo ao álcool, considerada doença pela Organização Mundial da Saúde. O uso constante, descontrolado e progressivo de bebidas alcoólicas pode comprometer seriamente o bom funcionamento do organismo, levando a consequências irreversíveis. A pessoa dependente do álcool, além de prejudicar a sua própria vida, acaba afetando a sua família, amigos e colegas de trabalho.", "A hipertensão arterial ou pressão alta é uma doença crônica caracterizada pelos níveis elevados da pressão sanguínea nas artérias. Ela acontece quando os valores das pressões máxima e mínima são iguais ou ultrapassam os 140/90 mmHg (ou 14 por 9).", "A tuberculose pulmonar é causada pela bactéria Mycobacterium tuberculosis, também conhecida como bacilo de Koch. Ela é transmitida pelo ar, por meio de gotículas provenientes de tosse ou espirro de uma pessoa infectada.", "Câncer é o nome dado a um conjunto de mais de 100 doenças que têm em comum o crescimento desordenado de células, que invadem tecidos e órgãos. Dividindo-se rapidamente, estas células tendem a ser muito agressivas e incontroláveis, determinando a formação de tumores, que podem espalhar-se para outras regiões do corpo.", "Asma é o estreitamento dos brônquios (canais que levam ar aos pulmões) que dificulta a passagem do ar provocando contrações ou broncoespasmos. As crises comprometem a respiração, tornando-a difícil.", "Depressão ou transtorno depressivo maior é uma doença comum e séria que afeta negativamente como você se sente, como pensa e como age. Felizmente, também é tratável. A depressão provoca sentimentos de tristeza e/ou perda de interesse em atividades que em momentos anteriores traziam prazer.", "Alergia ou reação de hipersensibilidade, é uma resposta exagerada do sistema imunológico após a exposição a uma série de agentes , em indivíduos predispostos geneticamente."]
    var isYes: [Bool] = [false, false, false, false, false, false, false, false, false, false]
    
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
    
    @IBAction func unwindToFamilyHistory(segue: UIStoryboardSegue) {
        
    }
}

extension FamilyHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.diseases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnamnesisTableViewCell", for: indexPath) as? AnamnesisTableViewCell else { return UITableViewCell() }
        
        cell.nameLabel.text = self.diseases[indexPath.row]
        cell.isYes.tag = indexPath.row
        cell.isYes.isOn = self.isYes[indexPath.row]
        cell.descriptionLabel.text = self.desciptionDiseases[indexPath.row]
        cell.isYes.addTarget(self, action: #selector(self.switchAction(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func switchAction(_ sender: UISwitch) {
        
        self.isYes[sender.tag] = sender.isOn
    }
}
