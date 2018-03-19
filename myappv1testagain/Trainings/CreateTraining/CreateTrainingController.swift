//
//  CreateTrainingController.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 18/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit
import CoreData

protocol CreateTrainingControllerDelegate {
    func didAddTraining(training: Training)
    func didEditTraining(training: Training)
}

class CreateTrainingController: UIViewController {
    
    var delegate: CreateTrainingControllerDelegate?
    var training: Training?
    
    let nameTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Entrez un nom pour votre séance"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let startDateLabel: UILabel = {
       let label = UILabel()
        label.text = "Entrez l'heure de début"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startDatePicker: UIDatePicker = {
       let dp = UIDatePicker()
        dp.datePickerMode = .dateAndTime
        dp.locale = Locale(identifier: "FR_fr")
        dp.translatesAutoresizingMaskIntoConstraints = false
        return dp
    }()
    
    let endDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Fin de l'entraînement"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let endDatePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .time
        dp.locale = Locale(identifier: "FR_fr")
        dp.translatesAutoresizingMaskIntoConstraints = false
        return dp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkBlue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        
        setupUIElements()
        
        let title = training == nil ? "Créer entraînement" : "Modifier"
        navigationItem.title = title
        
        if training != nil {
            preFetchFields()
        }
        
    }
    
    @objc private func handleCancel() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc private func handleSave() {
        
        training == nil ? createTraining() : editTraining()
        
    }
    
    private func createTraining() {
        
        guard let name = nameTextField.text else { return }
        
        if name.isEmpty {
            // show some error (alert controller)
            let alertController = UIAlertController(title: "Champ vide", message: "Entrez un nom pour votre séance", preferredStyle: .alert)
            let alertConfirmedAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertConfirmedAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let training = NSEntityDescription.insertNewObject(forEntityName: "Training", into: context)
        training.setValue(name, forKey: "name")
        training.setValue(startDatePicker.date, forKey: "startDate")
        training.setValue(endDatePicker.date, forKey: "endDate")
        
        do {
            try context.save()
            dismiss(animated: true, completion: {
                self.delegate?.didAddTraining(training: training as! Training)                
            })
        } catch let saveErr {
            print("Failed to save context:", saveErr)
        }
    }
    
    private func editTraining() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        training?.name = nameTextField.text
        training?.startDate = startDatePicker.date
        training?.endDate = endDatePicker.date
        
        do {
            try context.save()
            dismiss(animated: true, completion: {
                self.delegate?.didEditTraining(training: self.training!)
            })
        } catch let saveErr {
            print("Failed to save:", saveErr)
        }
    }
    
    private func preFetchFields() {
        guard let name = training?.name else { return }
        guard let startDate = training?.startDate else { return }
        guard let endDate = training?.endDate else { return }
        
        nameTextField.text = name
        startDatePicker.date = startDate
        endDatePicker.date = endDate
    }
    
}
