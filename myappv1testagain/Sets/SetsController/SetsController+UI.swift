//
//  SetsController+UI.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 23/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

extension SetsController {
    
    func setupUI() {
        
        let backgroundLabelAdd = UIView()
        backgroundLabelAdd.backgroundColor = .white
        backgroundLabelAdd.translatesAutoresizingMaskIntoConstraints = false
        
        let pickerHeight: CGFloat = 100
        let previewLabelHeight: CGFloat = 50
        
        [pickerRepsWeightUnit, backgroundLabelAdd, previewLabel, addButton, tableView].forEach { view.addSubview($0) }
        
        pickerRepsWeightUnit.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pickerRepsWeightUnit.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pickerRepsWeightUnit.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pickerRepsWeightUnit.heightAnchor.constraint(equalToConstant: pickerHeight).isActive = true
        
        backgroundLabelAdd.topAnchor.constraint(equalTo: pickerRepsWeightUnit.bottomAnchor).isActive = true
        backgroundLabelAdd.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundLabelAdd.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundLabelAdd.heightAnchor.constraint(equalToConstant: previewLabelHeight).isActive = true
        
        previewLabel.centerYAnchor.constraint(equalTo: backgroundLabelAdd.centerYAnchor).isActive = true
        previewLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        previewLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 100).isActive = true
        
        addButton.centerYAnchor.constraint(equalTo: previewLabel.centerYAnchor).isActive = true
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        tableView.topAnchor.constraint(equalTo: backgroundLabelAdd.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true        
        
    }
    
    
}
