//
//  SetsController+UIPickerView.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 23/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

extension SetsController {
    
    func setupPicker() {
        
        pickerRepsWeightUnit.delegate = self
        pickerRepsWeightUnit.dataSource = self
        pickerRepsWeightUnit.backgroundColor = .white
        pickerRepsWeightUnit.selectRow(9, inComponent: 0, animated: false)
        pickerRepsWeightUnit.selectRow(25, inComponent: 1, animated: false)
        pickerRepsWeightUnit.selectRow(0, inComponent: 2, animated: false)        
        
    }
    
    func setupPickerData() {
        pickerData = [ [], [], [] ]
        
        [Int16](1...100).forEach { pickerData[0].append($0) }
        [Int16](0...200).forEach { pickerData[1].append($0) }
        ["kgs","lbs"].forEach { pickerData[2].append($0) }
    }
    
    // MARK: Number Of Components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    // MARK: Number Of Rows In Components
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    // MARK: Title For Row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(pickerData[component][row])"
    }
    
    // MARK: Did Select Row At
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        previewLabel.text = "\(pickerData[0][pickerView.selectedRow(inComponent: 0)]) x \(pickerData[1][pickerView.selectedRow(inComponent: 1)]) \(pickerData[2][pickerView.selectedRow(inComponent: 2)])"
    }
    
    
}
