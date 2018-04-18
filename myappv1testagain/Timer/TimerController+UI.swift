//
//  TimerController+UI.swift
//  testtimer
//
//  Created by Joffrey Fortin on 18/04/2018.
//  Copyright © 2018 Joffrey Fortin. All rights reserved.
//

import UIKit

extension TimerController {
    
    func setupUI() {
        
        view.backgroundColor = .white
        
        [timeLabel, remainingTimeLabel, stopButton].forEach { view.addSubview($0) }
        
        
        
        NSLayoutConstraint.activate([timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     remainingTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     ])
        
        remainingTimeLabel.anchor(top: nil, left: nil, bottom: timeLabel.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 20)
        
        
        stopButton.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 50, paddingRight: 0, width: 100, height: 50)
        stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupCircleLayers() {
        
        shapeLayer = createCircleShapeLayer(strokeColor: .outlineStrokeColor, fillColor: .clear, radius: shapeRadius, lineWidth: lineWidth)
        shapeLayer.strokeEnd = 0
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        
        _ = createCircleShapeLayer(strokeColor: .trackStrokeColor, fillColor: .black, radius: (shapeRadius - lineWidth / 2) , lineWidth: 0)
    }
    
    func createCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor, radius: CGFloat, lineWidth: CGFloat) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = lineWidth
        layer.fillColor = fillColor.cgColor
        layer.lineCap = kCALineCapRound
        layer.position = view.center
        view.layer.addSublayer(layer)
        return layer
    }
}

