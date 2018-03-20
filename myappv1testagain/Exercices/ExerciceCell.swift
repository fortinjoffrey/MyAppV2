//
//  ExerciceCell.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 20/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

class ExerciceCell: UITableViewCell {
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        
        return label
        
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .tealColor
        textLabel?.textColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
