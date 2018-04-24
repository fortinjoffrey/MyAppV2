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
    var selectedTextField: UITextField?
    var selectedTextArea: Any?
    var textfieldMode: Bool?
    let heightForHorizontalPickerView: CGFloat = 50
    
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.delegate = self
        tf.placeholder = "Entrez un nom pour votre séance"
        tf.font = UIFont.systemFont(ofSize: 16)
        return tf
    }()
    
    let startDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Entrez l'heure de début"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let startDatePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .dateAndTime
        dp.locale = Locale(identifier: "FR_fr")
        return dp
    }()
    
    let endDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Fin de l'entraînement"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let endDatePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .time
        dp.locale = Locale(identifier: "FR_fr")
        return dp
    }()
    
    let notationLabel: UILabel = {
        let label = UILabel()
        label.text = "Notez la séance"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var notationPicker: NotationPickerView = {
        let pv = NotationPickerView()
        pv.dataSource = pv
        pv.delegate = pv
        pv.selectRow(5, inComponent: 0, animated: false)
        let rotationAngle: CGFloat = -.pi / 2        
        pv.transform = CGAffineTransform(rotationAngle: rotationAngle)
        return pv
    }()
    
    let tirednessNotationLabel: UILabel = {
        let label = UILabel()
        label.text = "Notez votre état de fatigue"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var tirednessNotationPicker: NotationPickerView = {
        let pv = NotationPickerView()
        pv.dataSource = pv
        pv.delegate = pv
        pv.selectRow(4, inComponent: 0, animated: false)
        let rotationAngle: CGFloat = -.pi / 2
        pv.transform = CGAffineTransform(rotationAngle: rotationAngle)
        return pv
    }()
    
    let notesLabel: UILabel = {
        let label = UILabel()
        label.text = "Remarques sur la séance"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var notesTextView: UITextView = {
        let tf = UITextView()
        tf.delegate = self
        tf.text = ""
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.backgroundColor = .white
        return tf
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightBlue
        
        setupCancelButtonInNavBar()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        
        let title = training == nil ? "Créer entraînement" : "Modifier"
        navigationItem.title = title
        
        if training != nil {
            preFetchFields()
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        setupUI()
        
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
        
        //
        training.setValue(notationPicker.selectedData, forKey: "notation")
        training.setValue(tirednessNotationPicker.selectedData, forKey: "tirednessNotation")
        training.setValue(notesTextView.text, forKey: "notes")
        
        
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
        training?.notation = notationPicker.selectedData
        training?.tirednessNotation = tirednessNotationPicker.selectedData
        training?.notes = notesTextView.text
        
        
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
        guard let notation = training?.notation else { return }
        guard let tirednessNotation = training?.tirednessNotation else { return }
        guard let notes = training?.notes else { return }
        
        
        nameTextField.text = name
        startDatePicker.date = startDate
        endDatePicker.date = endDate
        notationPicker.selectRow(Int(notation), inComponent: 0, animated: false)
        tirednessNotationPicker.selectRow(Int(tirednessNotation), inComponent: 0, animated: false)
        notesTextView.text = notes
    }
    
}















