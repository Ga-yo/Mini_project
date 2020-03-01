//
//  SignUpViewController.swift
//  Login
//
//  Created by 이가영 on 2020/03/01.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
var User = UserInfo()
class SignUpViewController: UIViewController {
    
  
    @IBOutlet weak var Nametext: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var doublecheck: UITextField!
    
    @IBAction func Signinbut(_ sender: UIButton) {
        guard let userN = Nametext.text else {return}
        guard let userE = emailtext.text else {return}
        guard let userP = passwordtext.text else {return}
        guard let userC = doublecheck.text else {return}
        
        //비밀번호와 재확인 text가 같다면 alert띄우기
        if userP == userC {
            let alerts = UIAlertController(title: "축하드립니다.", message: "\(userN)님 회원가입에 성공하셨습니다.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alerts.addAction(okAction)
            present(alerts, animated: false, completion: nil)
        }else{
            let alertf = UIAlertController(title: "이런!", message: "회원가입에 실패하셨습니다.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            
            alertf.addAction(okAction)
            present(alertf, animated: false, completion: nil)
        }
        //구조체 User의 정보를 추가하는 함수 호출
        User.addUser(name: userN, email: userE, password: userP)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
