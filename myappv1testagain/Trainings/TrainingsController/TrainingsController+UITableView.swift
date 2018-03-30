//
//  TrainingsController+UITableView.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 18/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

extension TrainingsController {
    
    func setupTableView() {
        tableView.register(TrainingCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .darkBlue
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        tableView.tableFooterView = UIView()
    }
    
    // MARK: Did Select Row At
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exercicesController = ExercicesController()
        exercicesController.training = trainings[indexPath.row]
        navigationController?.pushViewController(exercicesController, animated: true)
    }
    
    // MARK: Number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainings.count
    }
    
    // MARK: Cell for row at
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TrainingCell

        let training = trainings[indexPath.row]
        cell.training = training
        return cell
    }
    
    // MARK: Height for row at
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    // MARK: Edit Actions
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Supprimer", handler: deleteActionHandler)
        deleteAction.backgroundColor = .lightRed
        
        let editAction = UITableViewRowAction(style: .default, title: "Modifier", handler: editActionHandler)
        editAction.backgroundColor = .darkBlue
        
        return [deleteAction, editAction]
        
    }
    // MARK: Delete Handler
    @objc private func deleteActionHandler(action: UITableViewRowAction, indexPath: IndexPath) {
        
        let trainingToDelete = trainings[indexPath.row]
                
        if CoreDataManager.shared.deleteTraining(training: trainingToDelete) {
            trainings.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        
    }
    // MARK: Edit Handler
    @objc private func editActionHandler(action: UITableViewRowAction, indexPath: IndexPath) {
        
        let editTrainingController = CreateTrainingController()
        editTrainingController.training = trainings[indexPath.row]
        editTrainingController.delegate = self
        
        let navController = CustomNavigationController(rootViewController: editTrainingController)
        present(navController, animated: true, completion: nil)
    }
    
    // MARK: Header View
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }
    // MARK: Header Height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // MARK: Footer View
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Pas d'entraînements enregistrés"
        return label
    }
    
    // MARK: Footer Height
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return trainings.count > 0 ? 0 : 150
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let resumeAction = UIContextualAction(style: .normal, title: "Résumé") { (action, view, success) in
            let resumeTrainingController = ResumeTrainingController()
            resumeTrainingController.training = self.trainings[indexPath.row]
//            let navController = CustomNavigationController(rootViewController: resumeTrainingController)
            self.navigationController?.pushViewController(resumeTrainingController, animated: true)
//            self.present(navController, animated: true, completion: nil)
            success(true)
        }
        resumeAction.backgroundColor = .blue
        
        
        let leadingConfiguration = UISwipeActionsConfiguration(actions: [resumeAction])
        leadingConfiguration.performsFirstActionWithFullSwipe = true
        return leadingConfiguration
        
        
    }
    
}
