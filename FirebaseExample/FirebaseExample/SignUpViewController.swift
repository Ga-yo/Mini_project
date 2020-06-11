//
//  SignUpViewController.swift
//  FirebaseExample
//
//  Created by 이가영 on 2020/06/10.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import Firebase
import Foundation

class SignUpViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var cancel: UIButton!
    
    let remoteConfig = RemoteConfig.remoteConfig()
    var color: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let statusBar = UIView()
               self.view.addSubview(statusBar)
               statusBar.snp.makeConstraints { (m) in
                   m.right.top.left.equalTo(self.view)
                   m.height.equalTo(20)
               }
               color = remoteConfig["splash_background"].stringValue
        statusBar.backgroundColor = UIColor(hexString: color!)
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imagePicker)))
        signup.backgroundColor = UIColor(hexString: color!)
        cancel.backgroundColor = UIColor(hexString: color!)
        
        signup.addTarget(self, action: #selector(signupEvent), for: .touchUpInside)
        cancel.addTarget(self, action: #selector(cancelevent), for: .touchUpInside)
    }
    
    @objc func imagePicker(){
            let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary

        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = (info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
        
        self.dismiss(animated: true, completion: nil)
    }
    @objc func signupEvent() {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) {(user, err) in
            let uid = Auth.auth().currentUser?.uid
            
            let image = self.imageView.image!.jpegData(compressionQuality: 0.1)
            
            Storage.storage().reference().child("userImages").child(uid!).putData(image!, metadata: nil, completion: { (data, error) in
                let imageURL = storageref.downloadURL()
                Database.database().reference().child("users").child(uid!).setValue(["name": self.name.text!, "profile": imageURL])
            })
            
        }
    }

    @objc func cancelevent(){
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//    아이콘 제작자 <a href="http://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon"> www.flaticon.com</a>
}
