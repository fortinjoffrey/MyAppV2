//
//  NotationPickerView.swift
//  UIPickerView
//
//  Created by Joffrey Fortin on 24/04/2018.
//  Copyright © 2018 Joffrey Fortin. All rights reserved.
//

import UIKit

class NotationPickerView: UIPickerView {
    
    let data = [Int16](1...10)
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        subviews.forEach {
            $0.layer.borderWidth = 0
            $0.isHidden = $0.frame.height <= 1.0
        }
    }
}

extension NotationPickerView: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

extension NotationPickerView: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.text = "\(data[row])"
//        label.backgroundColor = .yellow

        let hue = CGFloat(row)/CGFloat(data.count) * 0.3
        label.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness:1.0, alpha: 1.0)

        
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        
        let rotationAngle: CGFloat = .pi / 2
        label.transform = CGAffineTransform(rotationAngle: rotationAngle)

        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(data[row])")
    }
}



















