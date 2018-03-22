//
//  ChooseExercicesController.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 22/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

class ChooseExercicesController: UITableViewController, UISearchBarDelegate {
    
    let cellId = "listCellId"
    var exercicesSearchBar: UISearchBar?
    var training: Training?
    var defaultExercices = [ExerciceDefault]()
    var filteredExercices = [ExerciceDefault]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        setupSearchBar()
        setupTableView()
        setupNavigationItem()
        setupDefaultExercices()
    }
    
    private func setupNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Terminer", style: .plain, target: self, action: #selector(handleSave))
//        navigationItem.titleView = exercicesSearchBar
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = training?.name
    }
    
    @objc private func handleSave() {
        
        print("Trying to save")
        
    }
}
