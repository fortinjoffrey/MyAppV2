//
//  CreateTrainingController+UI.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 18/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

extension CreateTrainingController {
    
    func setupUIElements() {
        
        _ = setupLightBlueBackgroundView(height: 280)
        
        [nameTextField, startDateLabel, startDatePicker, endDateLabel, endDatePicker].forEach { view.addSubview($0) }
        
        // MARK: TextField Constraints
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // MARK: Start Date Label Constraints
        startDateLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        startDateLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        startDateLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        startDateLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // MARK: Start Date Picker Constraints
        startDatePicker.topAnchor.constraint(equalTo: startDateLabel.bottomAnchor).isActive = true
        startDatePicker.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        startDatePicker.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        startDatePicker.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        // MARK: End Date Label Constraints
        endDateLabel.topAnchor.constraint(equalTo: startDatePicker.bottomAnchor).isActive = true
        endDateLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        endDateLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        endDateLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // MARK: End Date Picker Constraints
        endDatePicker.topAnchor.constraint(equalTo: endDateLabel.bottomAnchor).isActive = true
        endDatePicker.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        endDatePicker.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        endDatePicker.heightAnchor.constraint(equalToConstant: 65).isActive = true
    }
    
}
