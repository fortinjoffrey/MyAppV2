//
//  CreateExerciceController+UI.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 19/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

extension CreateExerciceController {
    
    func setupUI() {
        
        view.backgroundColor = .darkBlue
        
        _ = setupLightBlueBackgroundView(height: 50)
        
        [nameTextField].forEach { view.addSubview($0) }
        
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
    }    
}
