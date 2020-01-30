//
//  ViewController.swift
//  TrafficLight
//
//  Created by Andry Pro on 29.01.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IB Outlets
    
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var starButton: UIButton!
   
    // MARK: Private Properties
    
   private var trafficLightStatus = TrafficLighStatus.lightIsOff
    
   private let lightOff: CGFloat = 0.3
   private let lightOn: CGFloat = 1
    
    // MARK: Life Cicles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialView(for: redLightView)
        setInitialView(for: yellowLightView)
        setInitialView(for: greenLightView)
    }
    
    // MARK: IB Actions
    
    @IBAction func startButtonPressed() {
        starButton.setTitle("Next", for: .normal)
        
        switch trafficLightStatus {
        case .lightIsOff, .greenLightIsOn:
            redLightView.backgroundColor = UIColor.red.withAlphaComponent(lightOn)
            greenLightView.backgroundColor = UIColor.green.withAlphaComponent(lightOff)
            trafficLightStatus = .redLightIsOn
        case .redLightIsOn:
            redLightView.backgroundColor = UIColor.red.withAlphaComponent(lightOff)
            yellowLightView.backgroundColor = UIColor.yellow.withAlphaComponent(lightOn)
            trafficLightStatus = .yellowLightIsOn
        default:
            yellowLightView.backgroundColor = UIColor.yellow.withAlphaComponent(lightOff)
            greenLightView.backgroundColor = UIColor.green.withAlphaComponent(lightOn)
            trafficLightStatus = .greenLightIsOn
        }
        
    }
    
    // MARK: Priavte Methods
    
   private func setInitialView(for view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2
      
        switch view {
        case redLightView:
            view.backgroundColor = UIColor.red.withAlphaComponent(lightOff)
        case yellowLightView:
            view.backgroundColor = UIColor.yellow.withAlphaComponent(lightOff)
        case greenLightView:
            view.backgroundColor = UIColor.green.withAlphaComponent(lightOff)
        default:
            return
        }
    }
}

