//
//  ExercicesController.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 19/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

class ExercicesController: UITableViewController, CreateExerciceControllerDelegate {     
    
    var training: Training?
    var exercices = [Exercice]()
    let cellExerciceId = "cellExerciceId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = training?.name
        setupPlusButtonInNavBar(selector: #selector(handleAdd))
        
        setupTableView()
        
        fetchExercices()
    }
    
    private func fetchExercices() {
        
        guard let trainingExercices = training?.exercices?.allObjects as? [Exercice] else { return }
        
        let sortedTrainingExercices = trainingExercices.sorted(by: { $0.date! < $1.date!  })
        
        self.exercices = sortedTrainingExercices
        
    }
    
    @objc private func handleAdd() {
        
//        let createExerciceController = CreateExerciceController()
//        createExerciceController.delegate = self
//        createExerciceController.training = training
//        let navController = CustomNavigationController(rootViewController: createExerciceController)
//        present(navController, animated: true, completion: nil)
        
        let chooseExercicesController = ChooseExercicesController()
        chooseExercicesController.training = self.training
        chooseExercicesController.delegate = self
        let navController = CustomNavigationController(rootViewController: chooseExercicesController)
        present(navController, animated: true, completion: nil)
    }
}
