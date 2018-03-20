//
//  ExercicesController+CreateExerciceControllerDelegate.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 20/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

extension ExercicesController {
    
    func didAddExercice(exercice: Exercice) {
        exercices.append(exercice)
        let indexPath = IndexPath(row: exercices.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func didEditExercice(exercice: Exercice) {
        
        let row = exercices.index(of: exercice)
        exercices[row!] = exercice
        let reloadIndexPath = IndexPath(row: row!, section: 0)
        tableView.reloadRows(at: [reloadIndexPath], with: .middle)                
        
    }
}
