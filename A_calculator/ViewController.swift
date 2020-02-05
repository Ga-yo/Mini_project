//
//  ViewController.swift
//  A_calculator
//
//  Created by 이가영 on 2020/02/04.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    //1. 받은 숫자의 변수 선언
    var onenum: String = "0"
    var twonum: String = "0"
    var finish: String = "0"
    var operationtemp: String = ""
    
    //2. 숫자 버튼
    @IBAction func numberbutton(_ sender: UIButton){
        let numberbox = sender.titleLabel!.text!

        if operationtemp.count > 0 {
            if twonum == "0" {
                twonum = numberbox
            }
            else{
                twonum = twonum + numberbox
            }
            textLabel.text = twonum
        }
        else {
            if onenum == "0" {
                onenum = numberbox
            }
            else{
                onenum = onenum + numberbox
            }
            textLabel.text = onenum
        }
        
    }
    
    //계산하는 거 private 함수로 만들고 결과 값 계산하는 ibaction 만들어야함
    
    @IBAction func C(_ sender: UIButton){
        textLabel.text = "0"
        resetData()
    }
    
    @IBAction func operate(_ sender: UIButton){
        let oper = sender.titleLabel!.text!
        let firstDisplay = onenum
        if firstDisplay != "0"{
        operationtemp = oper
        }
        
    }
    
    @IBAction func enter(_ sender: UIButton){
        
        let onenumtemp: Int = Int(onenum)!
        let twonumtemp: Int = Int(twonum)!
        let op: String = operationtemp
        
        let resultnumtemp: Int = calculation(onenum: onenumtemp, operation: op , twonum: twonumtemp)
        
        textLabel.text = String(resultnumtemp)
        resetData()
    }
    
    private func calculation(onenum: Int, operation: String, twonum: Int) -> Int{
        var resultnum: Int = 0
        
        switch operation  {
        case "+":
            resultnum = onenum + twonum
        case "-":
            resultnum = onenum - twonum
        case "x":
            resultnum = onenum * twonum
        case "/":
            resultnum = onenum / twonum
        default:
            print("아무것도 아님")
        }
        
        return resultnum
        
    }
    
    private func resetData(){
        onenum = "0"
        twonum = "0"
        finish = "0"
        operationtemp = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textLabel.text = "0"
    }


}

