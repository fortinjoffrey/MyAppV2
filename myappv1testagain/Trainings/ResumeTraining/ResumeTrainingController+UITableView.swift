//
//  ResumeTrainingController+UITableView.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 30/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

extension ResumeTrainingController {
    
    func setupTableView() {
        tableView.backgroundColor = .darkBlue
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return exercices.count
    }
    
    // MARK: Header View
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = .lightBlue
        label.textColor = .darkBlue
        label.textAlignment = .center
        label.text = exercices[section].name
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }
    
    // MARK: Header Height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sets[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let set = sets[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = "\(set.rep) x \(set.weight) \(set.unit ?? "")"
        
        return cell
    }
    
    
}
