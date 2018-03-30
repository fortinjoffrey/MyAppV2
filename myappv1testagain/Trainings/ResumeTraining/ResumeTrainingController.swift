//
//  ResumeTrainingController.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 30/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

class ResumeTrainingController: UITableViewController {
    
    var training: Training?
    var exercices = [Exercice]()
    var sets = [[Set]]()
    let cellId = "resumeCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray

        navigationItem.title = training?.name
        
        setupTableView()
        
        fetchExercices()
    }
    
    
    private func fetchExercices() {
        
        guard let trainingExercices = training?.exercices?.allObjects as? [Exercice] else { return }
        
        exercices = trainingExercices.sorted(by: { $0.date! < $1.date!  })
        
        exercices.forEach { fetchSets(exercice: $0)  }

        
    }
    
    private func fetchSets(exercice: Exercice) {
        
        guard let exerciceSets = exercice.sets?.allObjects as? [Set] else { return }
        sets.append(exerciceSets)
//        let sortedExerciceSets = exerciceSets.sorted(by: { $0.date! < $1.date! })
   
    }

    
}
