//
//  TrainingCell.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 18/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

class TrainingCell: UITableViewCell {
    
    var training: Training? {
        didSet {
            nameLabel.text = training?.name
            
            let dateFormatDictionary = [dayLabel:"dd", monthLabel:"MMM", yearLabel:"yyyy", startDateLabel:"HH:mm"]
            
            let dateFormater = DateFormatter()
            dateFormater.locale = Locale(identifier: "FR_fr")
            
            if let startDate = training?.startDate {
                for(keys, value) in dateFormatDictionary {
                    dateFormater.dateFormat = value
                    keys.text = dateFormater.string(from: startDate).uppercased()
                }
            }
            
            if let endDate = training?.endDate {
                dateFormater.dateFormat = "HH:mm"
                endDateLabel.text = dateFormater.string(from: endDate)
            }
        }
    }
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "22"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.text = "SEPT"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.text = "2018"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let startDateLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let endDateLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jambes / Triceps"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .tealColor
        setupCellUI()
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellUI() {
        [dayLabel, monthLabel, yearLabel, startDateLabel, endDateLabel, nameLabel].forEach { addSubview($0) }
        
        monthLabel.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 60, height: 20)
        monthLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        dayLabel.anchor(top: nil, left: monthLabel.leftAnchor, bottom: monthLabel.topAnchor, right: monthLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)

        yearLabel.anchor(top: monthLabel.bottomAnchor, left: monthLabel.leftAnchor, bottom: nil, right: monthLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)
        
        nameLabel.anchor(top: nil, left: monthLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 250, height: 30)
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        startDateLabel.anchor(top: nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        endDateLabel.anchor(top: nameLabel.bottomAnchor, left: startDateLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
}



