//
//  UITableView+Helpers.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 22/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

extension UITableViewController {
    
    func displayCheckmarksForFinishedExercice(exercice: Exercice, indexPath: IndexPath) {
        if exercice.isDone {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    }
    
    
    func displayCheckmarksForSelectedExercice(selectedExercice: ExerciceDefault, indexPath: IndexPath) {
        if selectedExercice.hasBeenSelected {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = .black
        }
    }
    
}
