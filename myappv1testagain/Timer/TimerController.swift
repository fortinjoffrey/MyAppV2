//
//  TimerController.swift
//  testtimer
//
//  Created by Joffrey Fortin on 16/04/2018.
//  Copyright © 2018 Joffrey Fortin. All rights reserved.
//

import UIKit

class TimerController: UIViewController {
    
    var timer: Timer?
    var timerValue: CGFloat = 30.00
    lazy var count = self.timerValue
    
    let shapeRadius: CGFloat = 130
    let lineWidth: CGFloat = 25
    
    var shapeLayer = CAShapeLayer()
    
    let remainingTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Temps restant".uppercased()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 11)
        label.textAlignment = .center
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stopButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("stop", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(handleStop), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 0.0
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        return button
    }()
    
    @objc private func handleStop() {
        dismiss(animated: true, completion: nil)
    }
    
    /*
     
     
     layer.shadowColor = UIColor.black.cgColor
     layer.shadowOffset = CGSize(width: 0, height: 5)
     layer.shadowOpacity = 1
     layer.shadowRadius = 0.0
     layer.masksToBounds = false
     clipsToBounds = false
     layer.cornerRadius = 10
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCircleLayers()
        
        setupObservers()
        
        setupUI()
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleTimer() {
        
        let percentage = count / CGFloat(timerValue)
//        print(1 - percentage, count)
        shapeLayer.strokeEnd = 1 - percentage
        
        let seconds: Int = Int(count + 1) % 60
        let minutes: Int = (Int(count + 1) / 60) % 60
        
        if minutes == 0 {
            timeLabel.text = "\(seconds)"
        } else if minutes == 0 && seconds < 10 {
            timeLabel.text = String(format: "%01d", seconds)
        } else {
            timeLabel.text = String(format: "%01d:%02d", minutes, seconds)
        }
        
        if count <= 0 && shapeLayer.strokeEnd >= 1.0 {
            timer?.invalidate()
            
            dismiss(animated: true, completion: nil)
            
            
            // send notification and dismiss timer from view
        } else {
            count -= 0.01
        }
    }
}



