//
//  ViewController.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 18/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit
import CoreData

class TrainingsController: UITableViewController, CreateTrainingControllerDelegate {

    let cellId = "cellId"
    var trainings = [Training]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupTableView()
        
        navigationItem.title = "Entraînements"
        setupPlusButtonInNavBar(selector: #selector(handleAdd))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Tout effacer", style: .plain, target: self, action: #selector(handleReset))
        
        trainings = CoreDataManager.shared.fetchTrainings()
        
        trainings.forEach {
            
            
            print($0.name ?? "")
            print($0.startDate ?? "")
            print($0.endDate ?? "")
            
            if let startDate = $0.startDate, let endDate = $0.endDate {
                let components = Calendar.current.dateComponents([.hour, .minute], from: startDate, to: endDate)
                print("\(components.hour ?? 0) hours and \(components.minute ?? 0) minutes")
            }
        }
        
    }
    
    @objc private func handleAdd() {        
        let createTrainingController = CreateTrainingController()
        let navController = CustomNavigationController(rootViewController: createTrainingController)
        createTrainingController.delegate = self
        present(navController, animated: true, completion: nil)
        
    }
    
    @objc private func handleReset() {
        
        if CoreDataManager.shared.executeBatchDeleteRequest() {
            var indexPathsToRemove = [IndexPath]()
            
            for (index, _) in trainings.enumerated() {
                let indexPath = IndexPath(row: index, section: 0)
                indexPathsToRemove.append(indexPath)
            }
            
            trainings.removeAll()
            tableView.deleteRows(at: indexPathsToRemove, with: .left)
            
        }
        
        
    }
}

