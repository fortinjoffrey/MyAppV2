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
                    keys.text = dateFormater.string(from: startDate)
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.text = "SEPT"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.text = "2018"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startDateLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let endDateLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jambes / Triceps"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        
 
        monthLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        monthLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        monthLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        

        dayLabel.centerXAnchor.constraint(equalTo: monthLabel.centerXAnchor).isActive = true
        dayLabel.bottomAnchor.constraint(equalTo: monthLabel.topAnchor).isActive = true
        

        yearLabel.centerXAnchor.constraint(equalTo: monthLabel.centerXAnchor).isActive = true
        yearLabel.topAnchor.constraint(equalTo: monthLabel.bottomAnchor).isActive = true
        

        nameLabel.leftAnchor.constraint(equalTo: monthLabel.rightAnchor, constant: 16).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        startDateLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        startDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        endDateLabel.leftAnchor.constraint(equalTo: startDateLabel.rightAnchor, constant: 16).isActive = true
        endDateLabel.topAnchor.constraint(equalTo: startDateLabel.topAnchor).isActive = true
        
        
        
    }
}



