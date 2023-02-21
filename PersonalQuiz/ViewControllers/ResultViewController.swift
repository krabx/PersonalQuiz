//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var results: [Answer] = []
    
    // 1. Избавиться от кнопки возврата назад на экране результатов +
    // 2. Передать массив с ответами на экран с результатами +
    // 3. Определить наиболее часто встречающийся тип животного +
    // 4. Отобразить результаты в соответствии с этим животным +

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        animalLabel.text = "Вы - \(animalDefinition().rawValue)"
        
        descriptionLabel.text = animalDefinition().definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func animalDefinition() -> Animal {
        var dicts: [Animal: Int] = [:]
        
        for result in results {
            let animal = result.animal
            if dicts.index(forKey: animal) == nil {
                dicts[animal] = 1
            } else {
                dicts[animal]! += 1
            }
        }
        
        let newDicts = dicts.sorted { $0.1 > $1.1 }
        
        return newDicts.first!.key
    }
}
