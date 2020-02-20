//
//  ViewController.swift
//  Page_control
//
//  Created by 이가영 on 2020/02/20.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageArray = ["original.jpeg", "honey.jpeg", "bboring.jpeg"]
   
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBAction func pageControl(_ sender: UIPageControl) {
        imageview.image = UIImage(named: imageArray[pageControl.currentPage])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        imageview.image = UIImage(named: imageArray[0])
    }


}

