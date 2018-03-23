//
//  SetsController+UITableView.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 23/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

extension SetsController {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: setCellId)
        tableView.tableFooterView = UIView()        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: setCellId, for: indexPath)
        let set = sets[indexPath.row]
        cell.textLabel?.text = "\(set.rep) x \(set.weight) \(set.unit ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Supprimer") { (_, _, success) in

            let setToDelete = self.sets[indexPath.row]
            if CoreDataManager.shared.deleteSet(set: setToDelete) {
                self.sets.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
                success(true)
            }
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    
    
}
