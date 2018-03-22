//
//  ChooseExercicesController.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 22/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

class ChooseExercicesController: UITableViewController, UISearchBarDelegate {
    
    let cellId = "listCellId"
    var delegate: CreateExerciceControllerDelegate?
    
    var exercicesSearchBar: UISearchBar?
    var training: Training?
    var defaultExercices = [ExerciceDefault]()
    var filteredExercices = [ExerciceDefault]()
    var selectedExercices = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        setupSearchBar()
        setupTableView()
        setupNavigationItem()
        setupDefaultExercices()
    }
    
    private func setupNavigationItem() {
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Terminer", style: .plain, target: self, action: #selector(handleSave))
        
        let doneRightBarButtonItem = UIBarButtonItem(title: "Terminer", style: .plain, target: self, action: #selector(handleSave))
        let addLeftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddCustomExercice))
        let cancelLeftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        
        navigationItem.rightBarButtonItem = doneRightBarButtonItem
        navigationItem.leftBarButtonItems = [cancelLeftBarButtonItem,addLeftBarButtonItem]
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = training?.name
    }
    
    @objc private func handleSave() {
        
        dismiss(animated: true) {
            self.selectedExercices.forEach { self.createExercice(exerciceName: $0) }
        }
    }
    
    @objc private func handleAddCustomExercice() {
        print("Add custom exercice")
        // TODO: POSSIBILITE d'ajouter un exercice custom
    }
    
    private func createExercice(exerciceName: String) {

        guard let training = self.training else { return }
        
        let tuple = CoreDataManager.shared.createExercice(exerciceName: exerciceName, training: training)
        if let error = tuple.1 {
            // present an error use a UIAlertController
            print(error)
        } else {
            self.delegate?.didAddExercice(exercice: tuple.0!)
        }
    }
    
    
}
