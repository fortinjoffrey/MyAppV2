//
//  CreateExercice.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 19/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

protocol CreateExerciceControllerDelegate {
    func didAddExercice(exercice: Exercice)
    func didEditExercice(exercice: Exercice)
}

class CreateExerciceController: UIViewController {
    
    var delegate: CreateExerciceControllerDelegate?
    var training: Training?
    var exercice: Exercice?
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Entrez le nom de votre exercice"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Ajouter un exercice"
        setupCancelButtonInNavBar()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSaveExercice))
        
        setupUI()
        
        if exercice != nil {
            guard let exerciceName = exercice?.name else { return }
            nameTextField.text = exerciceName
        }
    }
    
    @objc private func handleSaveExercice() {
        
        
        exercice == nil ? createExercice() : editExercices()
        
        
    }
    
    private func createExercice() {
        guard let exerciceName = nameTextField.text else { return }
        guard let training = self.training else { return }
        
        
        let tuple = CoreDataManager.shared.createExercice(exerciceName: exerciceName, training: training)
        if let error = tuple.1 {
            // present an error use a UIAlertController
            print(error)
        } else {
            
            dismiss(animated: true, completion: {
                self.delegate?.didAddExercice(exercice: tuple.0!)
            })
        }
    }
    
    private func editExercices() {
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        exercice?.name = nameTextField.text
        
        do {
            try context.save()
            dismiss(animated: true, completion: {
                self.delegate?.didEditExercice(exercice: self.exercice!)
            })
        } catch let saveErr {
            print("Failed to save exercice changes:", saveErr)
        }
    }
    
}
