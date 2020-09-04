//
//  EquationViewController.swift
//  AppSurdo
//
//  Created by Luis Pereira on 31/08/20.
//  Copyright © 2020 Luis Pereira. All rights reserved.
//

import Foundation
import  UIKit

class EquationViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var color1 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    var correct = false
    var factsOfNumbers: [String]!
    @IBOutlet weak var popImageview: UIImageView!
    @IBOutlet weak var popLabel: UILabel!
    @IBOutlet weak var popBtm: UIButton!
//    var cardSpace1,cardSpace2, cardSpace3: UILabel!
    var selectedCard1: String?
    var selectedCard2: String?
    var selectedCard3: String?
    var countryList = ["A", "B", "C"]
    let cardSpace1 = UILabel(frame: CGRect(x: 30, y: 100, width: 350, height: 130))
    let cardSpace2 = UILabel(frame: CGRect(x: 30, y: 260, width: 350, height: 130))
    let cardSpace3 = UILabel(frame: CGRect(x: 30, y: 420, width: 350, height: 130))
    let answerSpace1 = UITextField(frame: CGRect(x: 30, y: 630, width: 70, height: 50))
    let equationSignal1 = UILabel(frame: CGRect(x: 105, y: 630, width: 50, height: 50))
    let answerSpace2 = UITextField(frame: CGRect(x: 170, y: 630, width: 70, height: 50))
    let equationSignal2 = UILabel(frame: CGRect(x: 250, y: 630, width: 50, height: 50))
    let answerSpace3 = UITextField(frame: CGRect(x: 310, y: 630, width: 70, height: 50))
    let answer = UILabel(frame: CGRect(x: 165, y: 740, width: 80, height: 60))

    
    override func viewDidLoad() {
        
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        
            createPickerView1()
            dismissPickerView1()
            createPickerView2()
            dismissPickerView2()
            createPickerView3()
            dismissPickerView3()
            
            cardSpace1.text = hideNumbers(fact: factsOfNumbers[0])
            cardSpace1.textColor = .black
            cardSpace1.textAlignment = .center
            cardSpace1.backgroundColor = color1
            cardSpace1.layer.cornerRadius = 20
            cardSpace1.layer.masksToBounds = true
            cardSpace1.numberOfLines = 0
        
            cardSpace2.text = hideNumbers(fact: factsOfNumbers[1])
            cardSpace2.textColor = .black
            cardSpace2.textAlignment = .center
            cardSpace2.backgroundColor = color1
            cardSpace2.layer.cornerRadius = 20
            cardSpace2.layer.masksToBounds = true
            cardSpace2.numberOfLines = 0
            
            cardSpace3.text = hideNumbers(fact: factsOfNumbers[2])
            cardSpace3.textColor = .black
            cardSpace3.textAlignment = .center
            cardSpace3.backgroundColor = color1
            cardSpace3.layer.cornerRadius = 20
            cardSpace3.layer.masksToBounds = true
            cardSpace3.numberOfLines = 0
            
//            answerSpace1.text = "1"
            answerSpace1.textColor = .black
            answerSpace1.textAlignment = .center
            answerSpace1.layer.borderColor = CGColor(srgbRed: 100/255, green: 100/255, blue: 100/255, alpha: 1)
            answerSpace1.layer.borderWidth = 2
            answerSpace1.layer.cornerRadius = 10
            answerSpace1.layer.masksToBounds = true
            
            equationSignal1.text = "+"
            equationSignal1.textColor = .black
            equationSignal1.textAlignment = .center
    //        equationSignal1.layer.cornerRadius = 10
    //        equationSignal1.layer.masksToBounds = true
            
//            answerSpace2.text = "2"
            answerSpace2.textColor = .black
            answerSpace2.textAlignment = .center
            answerSpace2.layer.borderColor = CGColor(srgbRed: 100/255, green: 100/255, blue: 100/255, alpha: 1)
            answerSpace2.layer.borderWidth = 2
            answerSpace2.layer.cornerRadius = 10
            answerSpace2.layer.masksToBounds = true
            
            equationSignal2.text = "-"
            equationSignal2.textColor = .black
            equationSignal2.textAlignment = .center
    //        answerSpace1.layer.cornerRadius = 10
    //        equationSignal2.layer.masksToBounds = true
            
//            answerSpace3.text = "3"
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
            
            answer.text = "18"
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            
            return countryList.count
            
        }
            
        else if pickerView.tag == 2 {
            
            return countryList.count
            
        }
            
        else if pickerView.tag == 3 {
            
            return countryList.count
            
        }
            
        else {
            
            return 1
            
        }
        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            
            return countryList[row]
            
        }
            
        else if pickerView.tag == 2 {
            
            return countryList[row]
            
        }
            
        else if pickerView.tag == 3 {
            
            return countryList[row]
            
        }
            
        else {
            
            return "1"
            
        }
       
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            
            selectedCard1 = countryList[row]
            answerSpace1.text = selectedCard1
            
        }
            
        else if pickerView.tag == 2 {
            
            selectedCard2 = countryList[row]
            answerSpace2.text = selectedCard2
            
        }
            
        else if pickerView.tag == 3 {
            
            selectedCard3 = countryList[row]
            answerSpace3.text = selectedCard3
            
        }
        
    }

    func createPickerView1() {
        
        let pickerView1 = UIPickerView()
        pickerView1.delegate = self
        answerSpace1.inputView = pickerView1
        pickerView1.tag = 1
        
    }

    func dismissPickerView1() {
        
        let toolBar1 = UIToolbar()
        toolBar1.sizeToFit()
        
        let button1 = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar1.setItems([button1], animated: true)
        toolBar1.isUserInteractionEnabled = true
        answerSpace1.inputAccessoryView = toolBar1
        
    }

    func createPickerView2() {
        
        let pickerView2 = UIPickerView()
        pickerView2.delegate = self
        answerSpace2.inputView = pickerView2
        pickerView2.tag = 2
        print("create")
        
    }

    func dismissPickerView2() {
        
        let toolBar2 = UIToolbar()
        toolBar2.sizeToFit()

        let button2 = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar2.setItems([button2], animated: true)
        toolBar2.isUserInteractionEnabled = true
        answerSpace2.inputAccessoryView = toolBar2
        
    }

    func createPickerView3() {
        
        let pickerView3 = UIPickerView()
        pickerView3.delegate = self
        answerSpace3.inputView = pickerView3
        pickerView3.tag = 3
        print("create")
        
    }

    func dismissPickerView3() {
        
        let toolBar3 = UIToolbar()
        toolBar3.sizeToFit()

        let button3 = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar3.setItems([button3], animated: true)
        toolBar3.isUserInteractionEnabled = true
        answerSpace3.inputAccessoryView = toolBar3
        
    }

    @objc func action() {
        
       view.endEditing(true)
        
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

    func checkAnswer(){
        
        // Fazer checagem do picker e muda valor de variavel "correct"
        if (answerSpace1.text == "A" && answerSpace2.text == "B" && answerSpace3.text == "C") {
            
            correct = true
            showPop(correct: true)
            
        }
            
        else {
            
            correct = false
            
        }
        
    }
    
    func showPop(correct: Bool){
        
        if (correct) {
            popImageview.image = UIImage(named: "RectangleCorrect")
            popLabel.text = "Parabéns"
            popBtm.titleLabel?.text = "Revelar números"
            
            
        } else {
            popImageview.image = UIImage(named: "RectangleWrong")
            popLabel.text = "Tente novamente"
            popBtm.titleLabel?.text = "OK"
        }
        
        popLabel.font = UIFont(name: "Superfruit", size: 27)
        popBtm.setImage(UIImage(named: "PinkRectangle"), for: .normal)
        
        popImageview.isHidden = false
        popBtm.isHidden = false
        popLabel.isHidden = false
    }
    
    @IBAction func revealNumbers(_ sender: Any) {
        popImageview.isHidden = true
        popBtm.isHidden = true
        popLabel.isHidden = true
        
        if (correct){
            cardSpace1.text = factsOfNumbers[0]
            cardSpace2.text = factsOfNumbers[1]
            cardSpace3.text = factsOfNumbers[2]
        }
       
    }
    
}
