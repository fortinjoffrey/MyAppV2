//
//  ChooseExercicesController+UISearchBar.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 22/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

extension ChooseExercicesController {
    
    func setupSearchBar() {
        
        let searchBarHeight: CGFloat = 40
        exercicesSearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: searchBarHeight))
        exercicesSearchBar?.delegate = self
        exercicesSearchBar?.placeholder = "Nom de l'exercice"
//        exercicesSearchBar?.scopeButtonTitles = ["Tous", "Récent"]
//        exercicesSearchBar?.showsScopeBar = true
//        exercicesSearchBar?.scopeBarBackgroundImage = UIImage()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filteredExercices = defaultExercices.filter({
            return $0.name.lowercased().contains(searchText.lowercased()) || searchText.isEmpty
        })
        tableView.reloadData()

    }
    
    
}
