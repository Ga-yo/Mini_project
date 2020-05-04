//
//  ViewController.swift
//  New_Calculator
//
//  Created by 이가영 on 2020/05/04.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var operation: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resetAC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = "0"

    }

    
    //var didSelect = true
    //숫자가 입력되고 있는지 확인
    var isTyping = false
    
    var fristN: String! = nil //첫번째 항을 기억할 변수
    var secondN: String! = nil //두번째 항을 기억할 변수
    var resultNum: String = "0" //결과를 나타낼 변수
    var operations: String = "" //연산자를 기억할 변수
    
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
        //연산 버튼을 누르면 첫번째 항의 숫자를 저장한다.
        fristN = resultLabel?.text
        
        resultLabel?.text = ""
        
        //현재 연산자를 변수에 기억한다.
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
        //결과 버튼을 누르면 두번째 항의 숫자를 저장한다.
        secondN = resultLabel?.text
        
        //연산하는 함수 호출
        resultNum = Calculation(operations, fristN, secondN)
        
        //결과라벨에 결과를 출력
        resultLabel?.text = resultNum
    }
    
    @IBAction func minusplus(_ sender: UIButton){
        let minus = Int(resultLabel.text!)
        //만약 지금 숫자가 양수이면 -를 붙이고 음수면 -를 제거한다.
        if minus! > 0{
            resultLabel.text = String(-minus!)
        }else if minus! < 0 {
            resultLabel.text?.removeFirst()
        }
    }
    
    @IBAction func percentage(_ sender: UIButton){
        //나눠야하기 때문에 double형으로 형변환을 해준다.
        let percent = Double(resultLabel.text!)
        
        resultLabel.text = String(percent!/100)
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

