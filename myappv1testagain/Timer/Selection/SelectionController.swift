//
//  SelectionController.swift
//  testtimer
//
//  Created by Joffrey Fortin on 17/04/2018.
//  Copyright © 2018 Joffrey Fortin. All rights reserved.
//

import UIKit

class SelectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var timers = [SelectedTimer(seconds: 15, minutes: 0),
                  SelectedTimer(seconds: 30, minutes: 0),
                  SelectedTimer(seconds: 0, minutes: 1),
                  SelectedTimer(seconds: 30, minutes: 1),
                  SelectedTimer(seconds: 0, minutes: 2),
                  SelectedTimer(seconds: 0, minutes: 3),
                  SelectedTimer(seconds: 0, minutes: 5),
                  SelectedTimer(seconds: 0, minutes: 10)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Timer"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(SelectionCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
   
    
}
