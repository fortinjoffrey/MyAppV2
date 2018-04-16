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
        backgroundLabelAdd.backgroundColor = .yellow
        
        let pickerHeight: CGFloat = 100
        let previewLabelHeight: CGFloat = 50
        
        [pickerRepsWeightUnit, backgroundLabelAdd, previewLabel, addButton, tableView].forEach { view.addSubview($0) }
        
        pickerRepsWeightUnit.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: pickerHeight)
        
        backgroundLabelAdd.anchor(top: pickerRepsWeightUnit.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: previewLabelHeight)
        
        previewLabel.anchor(top: backgroundLabelAdd.topAnchor, left: view.leftAnchor, bottom: nil, right: backgroundLabelAdd.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: previewLabelHeight)
        
        addButton.anchor(top: previewLabel.topAnchor, left: nil, bottom: previewLabel.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)

        tableView.anchor(top: backgroundLabelAdd.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)                
    }
}
