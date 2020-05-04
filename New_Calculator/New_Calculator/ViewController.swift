//
//  ViewController.swift
//  New_Calculator
//
//  Created by 이가영 on 2020/05/04.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var number: UIButton!
    @IBOutlet weak var operation: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resetAC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = "0"

    }

    var didSelect = true
    var isTyping = false
    var fristN: String! = nil
    var secondN: String! = nil
    var resultNum: String = "0"
    var operations: String = ""
    
    @IBAction func pressnum(_ sender: UIButton) {
        //숫자를 누르면 초기화 버튼이 C로 바뀐다.
        resetAC.setTitle("C", for: .normal)
        
        if isTyping {
            resultLabel?.text! += (sender.titleLabel?.text)!
            
        }else{
            resultLabel.text = sender.titleLabel?.text
            
            isTyping = true
        }
    }
    
    @IBAction func operating(_ sender: UIButton){
        fristN = resultLabel?.text
        
        resultLabel?.text = ""
        
        operations = (sender.titleLabel?.text)!
        
    }
    
    @IBAction func resetC(_ sender: UIButton){
        if resetAC.titleLabel?.text == "C" {
            resetAC.setTitle("AC", for: .normal)
            resultLabel.text = nil
            isTyping = false
        }
    }
    
    @IBAction func resultCal(_ sender: UIButton){
        
        secondN = resultLabel?.text
        
        resultNum = Calculation(operations, fristN, secondN)
        
        resultLabel?.text = resultNum
    }
    
    @IBAction func minusplus(_ sender: UIButton){
        let minus = Int(resultLabel.text!)
        if minus! > 0{
            resultLabel.text = String(-minus!)
        }else if minus! < 0 {
            resultLabel.text?.removeFirst()
        }
    }
    
    func Calculation(_ oper: String, _ firstNum: String?, _ secondNum: String?) -> String {
        
        let result: Double
        let first = Double(firstNum!)
        let second = Double(secondNum!)
        
        switch oper {
            case "/":
                result = first!/second!
                return String(result)
            case "-":
                result = first!-second!
                return String(result)
            case "+":
                result = first!+second!
                return String(result)
            case "X":
                result = first!*second!
                return String(result)
            default:
                return ""
        }
    }
}

