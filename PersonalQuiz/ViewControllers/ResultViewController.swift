//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var results: [Answer] = []
    
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
}

// MARK: - Private Methods
private extension ResultViewController {
    func animalDefinition() -> Animal {
        var countOfAnimals: [Animal: Int] = [:]
        
        for result in results {
            let animal = result.animal
            if countOfAnimals.index(forKey: animal) == nil {
                countOfAnimals[animal] = 1
            } else {
                countOfAnimals[animal]! += 1
            }
        }
        
        let sortCountOfAnimals = countOfAnimals.sorted { $0.1 > $1.1 }
        
        return sortCountOfAnimals.first!.key
    }
}
