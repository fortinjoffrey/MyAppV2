//
//  TrainingController+CreateTrainingControllerDelegate.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 18/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

extension TrainingsController {
    
    func didAddTraining(training: Training) {
        self.trainings.append(training)
        let indexPath = IndexPath(row: trainings.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func didEditTraining(training: Training) {
        let row = trainings.index(of: training)
        trainings[row!] = training
        let indexPath = IndexPath(row: row!, section: 0)
        tableView.reloadRows(at: [indexPath], with: .middle)
    }
}
