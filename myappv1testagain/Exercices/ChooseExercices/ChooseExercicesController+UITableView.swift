//
//  ChooseExercicesController+UITableView.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 22/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

extension ChooseExercicesController {
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        tableView.tableFooterView = UIView()
    }
    
    // MARK: Did Select Row At
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedExercice = filteredExercices[indexPath.row]
        selectedExercice.hasBeenSelected = !selectedExercice.hasBeenSelected
        print(selectedExercice.name)
        
        if selectedExercice.hasBeenSelected {
            showAlertForHavingSelectedExercice(title: "Ajouté", message: "")
            // TODO: créer et enregistrer l'exercice
            selectedExercices.append(selectedExercice.name)
            print(selectedExercices)
        }
    }
    
    // MARK: Number Of Row In Section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredExercices.count
    }
    
    
    // MARK: Cell For Row At
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = filteredExercices[indexPath.row].name
        return cell
        
    }
    
    // MARK: View For Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return exercicesSearchBar
        
    }    
    
    
}
