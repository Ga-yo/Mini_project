//
//  ZoomViewController.swift
//  9_PhotoScroll
//
//  Created by 이가영 on 2020/03/17.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var zoomImageView: UIImageView!

    var imagesave: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        zoomImageView.image = UIImage(named: imagesave)
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
