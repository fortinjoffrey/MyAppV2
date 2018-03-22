//
//  ExercicesController+UITableView.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 20/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit
import CoreData

extension ExercicesController {
    
    func setupTableView() {
        
        tableView.backgroundColor = .darkBlue
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellExerciceId)
        tableView.tableFooterView = UIView()
        
    }
    
    // MARK: Number Of Row In Section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercices.count
    }
    
    // MARK: Cell For Row At
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellExerciceId, for: indexPath)
        let exercice = exercices[indexPath.row]

        if exercice.isDone {
            cell.accessoryType = .checkmark
            cell.textLabel?.textColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        }
        
        cell.textLabel?.text = "\(exercice.name ?? "")"
        return cell
    }
    
    // Did select row at
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        let exercice = exercices[indexPath.row]

    }
    

    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let doneContextalAction = UIContextualAction(style: .normal, title: "Terminer") { (action, view, success) in
            let exercice = self.exercices[indexPath.row]
            if CoreDataManager.shared.changeExerciceIsDoneState(exercice: exercice) {
                tableView.reloadRows(at: [indexPath], with: .fade)
                self.displayCheckmarksForFinishedExercice(exercice: exercice, indexPath: indexPath)
                success(true)
            }
        }
        doneContextalAction.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        let leadingConfiguration = UISwipeActionsConfiguration(actions: [doneContextalAction])
        leadingConfiguration.performsFirstActionWithFullSwipe = true
        return leadingConfiguration
    }
    
    // MARK: Edit Actions
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Supprimer", handler: deleteActionHandler)
        deleteAction.backgroundColor = .lightRed
        
        let editAction = UITableViewRowAction(style: .default, title: "Modifier", handler: editActionHandler)
        editAction.backgroundColor = .darkBlue
        
        return [deleteAction, editAction]
        
    }
    
    // MARK: Delete Action Handler
    @objc private func deleteActionHandler(action: UITableViewRowAction, indexPath: IndexPath) {
        
        let exerciceToDelete = exercices[indexPath.row]
        if CoreDataManager.shared.deleteExercice(exercice: exerciceToDelete) {
            exercices.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    // MARK: Edit Action Handler
    @objc private func editActionHandler(action: UITableViewRowAction, indexPath: IndexPath) {
        
        let exercice = exercices[indexPath.row]
        let editExerciceController = CreateExerciceController()
        editExerciceController.delegate = self
        editExerciceController.exercice = exercice
        let navController = CustomNavigationController(rootViewController: editExerciceController)
        present(navController, animated: true, completion: nil)
        
        
    }

    
    // MARK: Header View
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = .lightBlue
        label.textColor = .darkBlue
        label.textAlignment = .center
        label.text = "Exercices"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }
    
    // MARK: Header Height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // MARK: Footer View
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "Pas d'exercices enregistrés"
        return label
    }
    
    // MARK: Footer Height
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return exercices.count > 0 ? 0 : 150
    }
}
