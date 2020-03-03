//
//  SignUpViewController.swift
//  Login
//
//  Created by 이가영 on 2020/03/01.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import Firebase

// 변수와 함수는 camelCase 권장!
// 클래스 밖의 전역변수는 다른 클래스에서도 사용가능하므로 LoginViewController파일의 전역변수 UserLogin과 같음!
// 굳이 한번더 선언할 필요 없음!
var User = UserInfo()

class SignUpViewController: UIViewController {
    @IBOutlet weak var Nametext: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var doublecheck: UITextField!

    func pwcheck() -> Bool {
        guard let userP = passwordtext.text else {return false}
        guard let userC = doublecheck.text else {return false}

        //비밀번호와 재확인 text가 같다면 alert띄우기
        if userP == userC {
            return true
        }else{
            // 대부분의 enum타입은 Swift의 타입추론을 통해 UIAlertController.Style.alert -> .alert 이런식으로 표현 가능
            // 코드의 가독성을 위해 바꾸는 걸 추천!
            let alertf = UIAlertController(title: "이런!", message: "다시 시도해주세요.1", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)

            alertf.addAction(okAction)
            present(alertf, animated: false, completion: nil)
            return false
        }
    }
    
    
    @IBAction func Signinbut(_ sender: UIButton) {
        //비밀번호와 재확인 text가 같다면 alert띄우기
        if !pwcheck() { return }

        Auth.auth().createUser(withEmail: emailtext.text!, password: passwordtext.text!
                ) { (user, error) in
                    if user !=  nil{
                        let alertss = UIAlertController(title: "축하드립니다", message: "회원가입 성공", preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                        alertss.addAction(okAction)
                        self.present(alertss, animated: false, completion: nil)
                    }
                    else{
                        let alertff = UIAlertController(title: "이런!", message: "다시 시도해주세요.2", preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                        
                        alertff.addAction(okAction)
                        self.present(alertff, animated: false, completion: nil)
                    }
                }
        //구조체 User의 정보를 추가하는 함수 호출
        
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
