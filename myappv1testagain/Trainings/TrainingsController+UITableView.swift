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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Supprimer", handler: deleteActionHandler)
        deleteAction.backgroundColor = .lightRed
        
        let editAction = UITableViewRowAction(style: .default, title: "Modifier", handler: editActionHandler)
        editAction.backgroundColor = .darkBlue
        
        return [deleteAction, editAction]
        
    }
    
    @objc private func deleteActionHandler(action: UITableViewRowAction, indexPath: IndexPath) {
        
        let trainingToDelete = trainings[indexPath.row]
        trainings.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        context.delete(trainingToDelete)
        
        do {
            try context.save()
        } catch let saveErr {
            print("Failed to save deletion:", saveErr)
        }
    }
    
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
    
}
