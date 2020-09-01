//
//  InitialViewController.swift
//  ChallengeDoisUnidos
//
//  Created by Elaine  Cruz on 31/08/20.
//  Copyright © 2020 Elaine  Cruz. All rights reserved.
//

import Foundation
import UIKit

class InitialViewController: UIViewController {


    var cores: [UIColor] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImageView(image: UIImage(named: "Rectangle"))
    
        var rectangle = UIImageView(image: UIImage(named: "Rectangle"))
        var factOfSeries = UILabel()
        factOfSeries.text = "Fato de série"
        let command = UILabel()
        command.numberOfLines = 0
        command.text = " Procure as cartas na cena para formar uma combinação algébrica que resulte em (valor)."
        let camButton = UIButton()
        camButton.setImage(UIImage(named: "Cam"), for: .normal)
        
        rectangle.addSubview(factOfSeries)
        rectangle.addSubview(command)
        rectangle.addSubview(camButton)
        
        self.view.addSubview(logo)
        self.view.addSubview(rectangle)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        factOfSeries.translatesAutoresizingMaskIntoConstraints = false
        command.translatesAutoresizingMaskIntoConstraints = false
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        camButton.translatesAutoresizingMaskIntoConstraints  = false
        
        
        self.view.addConstraint(NSLayoutConstraint(item: logo, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 70))
        logo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 50).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.view.addConstraint(NSLayoutConstraint(item: rectangle, attribute: .top, relatedBy: .equal, toItem: logo, attribute: .bottom, multiplier: 1.0, constant: 100))
        rectangle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//         rectangle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        //rectangle.widthAnchor.constraint(equalToConstant: self.view.frame.width*0.8).isActive = true
        rectangle.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        factOfSeries.centerXAnchor.constraint(equalTo: rectangle.centerXAnchor).isActive = true
        factOfSeries.widthAnchor.constraint(equalToConstant: 100).isActive = true
        factOfSeries.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
        self.view.addConstraint(NSLayoutConstraint(item: command, attribute: .top, relatedBy: .equal, toItem: factOfSeries, attribute: .bottom, multiplier: 1.0, constant: 100))
        command.centerXAnchor.constraint(equalTo: rectangle.centerXAnchor).isActive = true
        command.widthAnchor.constraint(equalToConstant: 250).isActive = true
        command.heightAnchor.constraint(equalToConstant: 70).isActive = true

        camButton.centerXAnchor.constraint(equalTo: rectangle.centerXAnchor).isActive = true
        self.view.addConstraint(NSLayoutConstraint(item: camButton, attribute: .top, relatedBy: .equal, toItem: command, attribute: .bottom, multiplier: 1.0, constant: 30))
        camButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        camButton.heightAnchor.constraint(equalToConstant: 66).isActive = true
        
    }
}