//
//  ViewController.swift
//  FoodTracker
//
//  Created by 이가영 on 2020/03/30.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        
        photoImageView.isUserInteractionEnabled = true
        
    }

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer){

        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        print("touched")

        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func setName(_ sender: UIButton) {
        mealNameLabel.text = "Default name"
    }
    
    //MARK: Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
         mealNameLabel.text = textField.text
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        //취소버튼을 누르면 실행
        print("취소")
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
              
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
                }
              photoImageView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
        }


}
