//
//  CreateTrainingController+UI.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 18/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

extension CreateTrainingController {
    
    func setupUI() {
        
        view.addSubview(scrollView)
        
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        let scrollContainerView = UIView()
        scrollContainerView.backgroundColor = .lightBlue
        
        scrollView.addSubview(scrollContainerView)
        
        scrollContainerView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 800)
        
        let notationContainerView = UIView()
        let tirednessNotationContainerView = UIView()
        
        [nameTextField, startDateLabel, startDatePicker, endDateLabel, endDatePicker, notationLabel, notationContainerView, tirednessNotationLabel, tirednessNotationContainerView, notesLabel, notesTextView].forEach { scrollContainerView.addSubview($0)}
        
        nameTextField.anchor(top: scrollContainerView.topAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50)
        
        startDateLabel.anchor(top: nameTextField.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        startDatePicker.anchor(top: startDateLabel.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 65)
        
        endDateLabel.anchor(top: startDatePicker.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        endDatePicker.anchor(top: endDateLabel.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 65)
        
        notationLabel.anchor(top: endDatePicker.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        notationContainerView.anchor(top: notationLabel.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 65)
        
        notationContainerView.addSubview(notationPicker)
        
        notationPicker.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: heightForHorizontalPickerView, height: view.frame.width)
        notationPicker.centerXAnchor.constraint(equalTo: notationContainerView.centerXAnchor).isActive = true
        notationPicker.centerYAnchor.constraint(equalTo: notationContainerView.centerYAnchor).isActive = true
        
        tirednessNotationLabel.anchor(top: notationContainerView.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        tirednessNotationContainerView.anchor(top: tirednessNotationLabel.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 65)
        tirednessNotationContainerView.addSubview(tirednessNotationPicker)
        
        tirednessNotationPicker.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: heightForHorizontalPickerView, height: view.frame.width)
        tirednessNotationPicker.centerXAnchor.constraint(equalTo: tirednessNotationContainerView.centerXAnchor).isActive = true
        tirednessNotationPicker.centerYAnchor.constraint(equalTo: tirednessNotationContainerView.centerYAnchor).isActive = true
        
        notesLabel.anchor(top: tirednessNotationContainerView.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        notesTextView.anchor(top: notesLabel.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200)
        
        
        
    }
    
}
