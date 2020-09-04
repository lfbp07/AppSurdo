//
//  EquationViewController.swift
//  AppSurdo
//
//  Created by Luis Pereira on 31/08/20.
//  Copyright © 2020 Luis Pereira. All rights reserved.
//

import Foundation
import  UIKit

class EquationViewController : UIViewController{
    
    var color1 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    var factsOfNumbers: [String]!
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            let cardSpace1 = UILabel(frame: CGRect(x: 30, y: 100, width: 350, height: 130))
            cardSpace1.text = hideNumbers(fact: factsOfNumbers[0])
            cardSpace1.textColor = .black
            cardSpace1.textAlignment = .center
            cardSpace1.backgroundColor = color1
            cardSpace1.layer.cornerRadius = 20
            cardSpace1.layer.masksToBounds = true
            cardSpace1.numberOfLines = 0
            
            let cardSpace2 = UILabel(frame: CGRect(x: 30, y: 260, width: 350, height: 130))
            cardSpace2.text = hideNumbers(fact: factsOfNumbers[1])
            cardSpace2.textColor = .black
            cardSpace2.textAlignment = .center
            cardSpace2.backgroundColor = color1
            cardSpace2.layer.cornerRadius = 20
            cardSpace2.layer.masksToBounds = true
            cardSpace2.numberOfLines = 0
            
            let cardSpace3 = UILabel(frame: CGRect(x: 30, y: 420, width: 350, height: 130))
            cardSpace3.text = hideNumbers(fact: factsOfNumbers[2])
            cardSpace3.textColor = .black
            cardSpace3.textAlignment = .center
            cardSpace3.backgroundColor = color1
            cardSpace3.layer.cornerRadius = 20
            cardSpace3.layer.masksToBounds = true
            cardSpace3.numberOfLines = 0
            
            let answerSpace1 = UILabel(frame: CGRect(x: 30, y: 630, width: 70, height: 50))
            answerSpace1.text = "1"
            answerSpace1.textColor = .black
            answerSpace1.textAlignment = .center
            answerSpace1.layer.borderColor = CGColor(srgbRed: 100/255, green: 100/255, blue: 100/255, alpha: 1)
            answerSpace1.layer.borderWidth = 2
            answerSpace1.layer.cornerRadius = 10
            answerSpace1.layer.masksToBounds = true
            
            
            let equationSignal1 = UILabel(frame: CGRect(x: 105, y: 630, width: 50, height: 50))
            equationSignal1.text = "+"
            equationSignal1.textColor = .black
            equationSignal1.textAlignment = .center
    //        equationSignal1.layer.cornerRadius = 10
    //        equationSignal1.layer.masksToBounds = true
            
            let answerSpace2 = UILabel(frame: CGRect(x: 170, y: 630, width: 70, height: 50))
            answerSpace2.text = "2"
            answerSpace2.textColor = .black
            answerSpace2.textAlignment = .center
            answerSpace2.layer.borderColor = CGColor(srgbRed: 100/255, green: 100/255, blue: 100/255, alpha: 1)
            answerSpace2.layer.borderWidth = 2
            answerSpace2.layer.cornerRadius = 10
            answerSpace2.layer.masksToBounds = true
            
            let equationSignal2 = UILabel(frame: CGRect(x: 250, y: 630, width: 50, height: 50))
            equationSignal2.text = "-"
            equationSignal2.textColor = .black
            equationSignal2.textAlignment = .center
    //        answerSpace1.layer.cornerRadius = 10
    //        equationSignal2.layer.masksToBounds = true
            
            let answerSpace3 = UILabel(frame: CGRect(x: 310, y: 630, width: 70, height: 50))
            answerSpace3.text = "3"
            answerSpace3.textColor = .black
            answerSpace3.textAlignment = .center
            answerSpace3.layer.borderColor = CGColor(srgbRed: 100/255, green: 100/255, blue: 100/255, alpha: 1)
            answerSpace3.layer.borderWidth = 2
            answerSpace3.layer.cornerRadius = 10
            answerSpace3.layer.masksToBounds = true
            
    //        let equationSignal3 = UILabel(frame: CGRect(x: 30, y: 650, width: 50, height: 50))
    //        equationSignal3.text = "="
    //        equationSignal3.textAlignment = .center
    //        equationSignal3.layer.cornerRadius = 10
    //        equationSignal3.layer.masksToBounds = true
            
            let answer = UILabel(frame: CGRect(x: 165, y: 740, width: 80, height: 60))
            answer.text = "10"
            answer.textColor = .black
            answer.textAlignment = .center
            answer.layer.borderColor = CGColor(srgbRed: 100/255, green: 100/255, blue: 100/255, alpha: 1)
            answer.layer.borderWidth = 2
            answer.layer.cornerRadius = 10
            answer.layer.masksToBounds = true
            
            self.view.addSubview(cardSpace1)
            self.view.addSubview(cardSpace2)
            self.view.addSubview(cardSpace3)
            self.view.addSubview(answerSpace1)
            self.view.addSubview(equationSignal1)
            self.view.addSubview(answerSpace2)
            self.view.addSubview(equationSignal2)
            self.view.addSubview(answerSpace3)
    //        self.view.addSubview(equationSignal3)
            self.view.addSubview(answer)
            
    }
    
    func hideNumbers(fact:String)->String{
        
        let hidedString = Array(fact)
        var newString = String()
        for index in hidedString.indices{
            
            if hidedString[index].isNumber{
                newString.append("?")
            }else{
                newString.append(hidedString[index])
            }
        
        }
        return newString
    }

    
}
