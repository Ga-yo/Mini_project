//
//  PhotoCommentViewController.swift
//  9_PhotoScroll
//
//  Created by 이가영 on 2020/03/16.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class PhotoCommentViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textlabel: UITextField!

    var photoName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let photoName = photoName {
          ImageView.image = UIImage(named: photoName)
        }
        // Do any additional setup after loading the view.

        let generalTapGesture = UITapGestureRecognizer(target: self, action: Selector.generalTap)
        view.addGestureRecognizer(generalTapGesture)

    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
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

extension Selector {
    static let generalTap = #selector(PhotoCommentViewController.dismissKeyboard)
}
