//
//  SelectionCell.swift
//  testtimer
//
//  Created by Joffrey Fortin on 18/04/2018.
//  Copyright © 2018 Joffrey Fortin. All rights reserved.
//

import UIKit

class SelectionCell: UICollectionViewCell {
    
    var timer: SelectedTimer? {
        didSet {
            
            guard let seconds = timer?.seconds else { return }
            guard let minutes = timer?.minutes else { return }
            
            if minutes == 0 {
                timerLabel.text = "\(seconds)SEC"
            } else if seconds == 0 {
                timerLabel.text = "\(minutes)MIN"
            } else {
                timerLabel.text = "\(minutes)MIN\(seconds)SEC"
            }
        }
    }
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setCellShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        backgroundColor = UIColor(red: 11/255, green: 22/255, blue: 53/255, alpha: 1)
        
        addSubview(timerLabel)
        timerLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func setCellShadow() {
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 1
        layer.shadowRadius = 0.0
        layer.masksToBounds = false
        clipsToBounds = false
        layer.cornerRadius = 10
    }
    
}
