//
//  SetsController.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 23/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit
import CoreData

class SetsController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var exercice: Exercice?
    
    let setCellId = "setCellId"
    
    var pickerData = [[Any]]()
    var sets = [Set]()
    
    let pickerRepsWeightUnit: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let previewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = .orange
        label.text = "10 x 25 kgs"
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: UIButtonType.contactAdd)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleAddSet), for: .touchUpInside)
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = exercice?.name
        view.backgroundColor = .darkBlue
        
        setupUI()
        setupPickerData()
        setupPicker()
        setupTableView()
        
        fetchSets()
        
    }
    
    @objc private func handleAddSet() {
        
        guard let rep = pickerData[0][pickerRepsWeightUnit.selectedRow(inComponent: 0)] as? Int16 else { return }
        guard let weight = pickerData[1][pickerRepsWeightUnit.selectedRow(inComponent: 1)] as? Int16 else { return }
        guard let unit = pickerData[2][pickerRepsWeightUnit.selectedRow(inComponent: 2)] as? String else { return }
        guard let exercice = self.exercice else { return }
        
        let tuple = CoreDataManager.shared.createSet(rep: rep, weight: weight, unit: unit, exercice: exercice)
        
        if let error = tuple.1 {
            print(error)
        } else {
            didAddSet(set: tuple.0!)
        }
    }
    
    private func didAddSet(set: Set) {
        sets.append(set)
        let indexPath = IndexPath(row: sets.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    private func fetchSets() {
        
        guard let exerciceSets = exercice?.sets?.allObjects as? [Set] else { return }
        
        let sortedExerciceSets = exerciceSets.sorted(by: { $0.date! < $1.date! })
        
        self.sets = sortedExerciceSets
        
    }
}
