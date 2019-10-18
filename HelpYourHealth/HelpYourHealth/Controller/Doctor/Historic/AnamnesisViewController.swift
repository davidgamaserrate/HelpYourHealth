//
//  AnamnesisViewController.swift
//  HelpYourHealth
//
//  Created by Rafael Escaleira on 08/10/19.
//  Copyright © 2019 Rafael Escaleira. All rights reserved.
//

import UIKit

class AnamnesisViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var diseases: [String] = ["Doenças do Coração", "Doença dos Nervos", "Palpitação", "Cálculo Biliar", "Infarto", "Doença dos Rins (nefrite, cálculo)", "Hipertensão Arterial (pressão alta)", "Dores nas costas", "Dispnéia (falta de ar)", "Dores nos ombros, braços, mãos", "Doenças do Pulmão ", "Dores nas pernas, pés", "Asma", "Doenças da Tireóide", "Tuberculose", "Varizes", "Bronquite (tosse crônica)", "Varicocele", "Doença do Estômago (úlcera, gastrite)", "Doença das Hemorróidas", "Doença do Fígado (hepatite)", "Alergia", "Hérnia", "Intolerância a vacinas ou soros", "Doença do Nariz, Garganta, Ouvido", "Fraturas", "Problemas de visão", "Reumatismo", "Doença do Pâncreas (Pancreatite)", "Foi submetido a alguma cirurgia", "Diabetes", "Alcoolismo", "Câncer, tumores", "Obesidade", "Doença da Pele", "Cefaléias (dores de cabeça) frequentes"]
    var desciptionDiseases: [String] = ["Falta de ar no repouso ou no esforço, Dor no peito, Tosse seca e persistente, Cor azulada nas pontas dos dedos, Tonturas ou desmaios, Palpitações ou taquicardia, Inchaço nas pernas, Cansaço excessivo sem razão aparente, Suor frio, Enjoo ou perda de apetite", "Fraqueza e atrofia muscular, Alterações da sensibilidade (dor, formigamento, queimação), Desequilíbrio, Disfunções autonômicas e reflexas, como tonturas e impotência sexual.", "Palpitações ocorrem quando os batimentos cardíacos são percebidos. A sensação pode estar associada a batimentos fortes, vibrantes, acelerados ou fora de ritmo. Outros sintomas, como desconforto torácico ou falta de ar, podem estar presentes dependendo do motivo das palpitações.", "Dor abdominal aguda, Pode irradiar pelas costas, Costuma ocorrer minutos após a refeição, Febre, Amarelamento da pele e da parte branca dos olhos (icterícia, Inchaço abdominal, Fezes claras, Náuseas e vômitos.", "Dor aguda no peito, que perdura por mais de 20 minutos e pode se irradiar para pescoço, mandíbula, costas, braço ou ombro esquerdo (também pode se manifestar como queimação, sensação de peso ou aperto no peito e formigamento no braço)", "Câncer renal, Câncer de bexiga, Câncer de próstata, Cálculo renal, Infecção urinária, Hiperplasia benigna da próstata, Doenças dos glomérulos renais, Doença policística renal, Trauma renal, Medicamentos, Tuberculose urinária, Esforço físico, Excesso de cálcio na urina, Endometriose.", "Dores no peito, Dor de cabeça, Tonturas, Zumbido no ouvido, Visão turva.", "Má postura, Sedentarismo, Hérnia de disco, Ciática, Artrose, Lombalgia, Dorsalgia, Espondilite anquilosante.", "Falta de ar durante repouso, Redução do nível de consciência, agitação ou confusão, Desconforto torácico ou a sensação de que o coração está disparado, acelerado ou pulou um batimento (palpitações, Perda de peso, Suores noturnos.", "Uma discopatia degenerativa cervical pode causar dor irradiada da coluna cervical para os ombros, braços e mãos. O tratamento do Método Mckenzie demonstra grande eficácia nestes casos por agir diretamente na redução dos sintomas provocados pelos desgastes do disco, promovendo alívio da dor em poucas sessões.", "Tosse, Dor no peito, Rouquidão, Perda de apetite, Falta de ar, Fadiga, Tosse com expectoração mucosa, Tosse com expectoração com sangue.", "Alterações musculares ou nos tendões. A dor nas pernas de causa osteo muscular não segue o trajeto dos nervos e pioram ao movimentar as pernas.", "Tosse seca, Chiado no peito, Dificuldade para respirar, Respiração rápida e curta, Desconforto torácico, Ansiedade.", "Perda de peso, Aumento do apetite, Aumento da frequência cardíaca, palpitações cardíacas, aumento da pressão arterial, nervosismo e transpiração excessiva, Evacuações mais frequentes, às vezes com diarreia, Fraqueza muscular, mãos trêmulas.", "Tosse, com ou sem secreção, que pode ser espessa ou até sanguinolenta, Cansaço excessivo, Falta de ar, Febre baixa, mais comum à tarde, Sudorese noturna, Falta de apetite, Perda de peso, Rouquidão.", "Dor, ardor, ou sensação de peso nas pernas, que podem ser mais acentuados no fim do dia, Leve inchaço, geralmente envolvendo apenas os pés e tornozelos, Coceira na pele sobre a veia varicosa.", "Tosse com presença de muco, Ronco ou chiado no peito, Fadiga, Dificuldade para respirar e falta de ar, Febre e calafrios, Desconforto no peito.", "Dor nos testículos, que pode variar entre o desconforto a dor intensa, Dor que melhora ao deitar de barriga para cima, Inchaço ou presença de caroço nos testículos, Sensação de peso nos testículos, Infertilidade.", "Fadiga, Sensação de inchaço após comer, Sensação de saciedade após ingerir pequenas quantidades de alimentos, Azia grave e persistente, Indigestão grave, Náuseas persistentes e aparentemente sem explicação, Dor de estômago, Vômitos persistentes.", "Dor anal, principalmente enquanto se está sentado, Sangue vermelho vivo no papel higiênico, nas fezes ou no vaso sanitário, Dor ao evacuar, Um ou mais nódulos endurecidos sensíveis próximos ao ânus, Inchaço ao redor do ânus.", "Febre, Icterícia (pele e olhos amarelados, Náuseas e vômito, Mal-estar, Desconforto abdominal, Falta de apetite, Urina com cor laranja escuro, Fezes esbranquiçadas.", "Secreção nasal, deixando o nariz entupido, Coceira no nariz, Espirros constantes, Nariz vermelho, Tosse seca e dificuldade para respirar, Vermelhidão nos olhos e lacrimejamento, Dores de cabeça.", "Dor no local afetado, Náuseas, Vômitos.", "Existe a probabilidade de ocorrência da síndrome de Guillain-Barré (SGB) após a vacinação contra o influenza. Quando os sintomas surgem seis semanas depois da aplicação, o paciente não deve recebê-la novamente porque a SGB prévia aumenta o risco de novo episódio.", "Dor na região da face, especialmente nas regiões das maçãs do rosto, ao redor do nariz e em volta dos olhos, Dor de cabeça ou na face que piora ao abaixar a cabeça ou deitar, Corrimento e congestão nasal, que pode ser branca, amarelada ou esverdeada.", "Dor intensa, Inchaço do local fraturado, Deformidade do local, Incapacidade total ou parcial de mexer o membro fraturado, Presença de hematomas, Presença de ferimentos no local da fratura, Diferença de temperatura entre o local fraturado e o sem fratura, Dormência e formigamento da área.", "Lacrimejamento em excesso, Hipersensibilidade à luz, Sensação de vista cansada, Dificuldade para enxergar à noite, Dor de cabeça frequente, Vermelhidão e dor nos olhos, Coceira nos olhos, Visualização de imagens duplicadas.", "Dor nas articulações, Inchaço e vermelhidão das articulações, Dificuldade para movimentar as articulações, especialmente ao acordar, Dor nos músculos próximos da articulação.", "Dor no estômago e nas costas, Perda de peso sem motivo, Indigestão, Mudança nos hábitos intestinais, como fezes que flutuam, Outros indícios são: Perda de apetite, Icterícia (pele ou olho amarelado, Sensação de estar doente.", "", "Vontade frequente de urinar, Fome excessiva, Sede excessiva, Emagrecimento, Fraqueza, Fadiga, Nervosismo, Mudanças de humor.", "Dificuldade de controlar o consumo: não conseguir parar de beber depois de ter começado, Sintomas de abstinência física, como náusea, suor, tremores e ansiedade, quando se para de beber.", "Emagrecer sem fazer dieta ou praticar exercícios, Cansaço intenso fazendo pequenas tarefas, Dor que não passa, Febre que vai e volta, sem tomar remédio, Alterações nas fezes, Dor ao urinar ou urina escura, Demora para cicatrizar feridas, Sangramentos.", "Falta de ar: causada pela pressão do peso do abdômen sobre o pulmão, Dores corporais: o excesso de esforço para suportar o peso pode trazer desconforto nos joelhos, pernas e costas, Falta de condicionamento físico: dificuldade para concluir uma simples caminhada ou algum esforço maior.", "Melasma, Vitiligo, Psoríase, Dermatite, Acne (espinhas, Melanoma, Pano branco.", "Leve dor ou pressão na frente, topo ou laterais da cabeça, Dor de cabeça que ocorre no final do dia, Dificuldade em adormecer e manter o sono, Fadiga crônica, Irritabilidade, Dificuldade de concentração, Sensibilidade à luz ou ruído, Dores musculares."]
    var isYes: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]

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
    
    @IBAction func unwindToAnamnesis(segue: UIStoryboardSegue) {

    }
}

extension AnamnesisViewController: UITableViewDelegate, UITableViewDataSource {
    
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

public class AnamnesisTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var isYes: UISwitch!
}
