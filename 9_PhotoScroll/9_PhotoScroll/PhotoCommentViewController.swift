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
    @IBOutlet weak var pageControl: UIPageControl!

    var photoName: String?
    var photoIndex: Int!
    var photoNumber: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let photoName = photoName {
            ImageView.image = UIImage(named: photoName)
        }
        // Do any additional setup after loading the view.
        scrollView.isPagingEnabled = true
        pageControl.isUserInteractionEnabled = true

        pageControl.numberOfPages = images.count
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.systemIndigo
        pageControl.currentPage = photoNumber

        let generalTapGesture = UITapGestureRecognizer(target: self, action: Selector.generalTap)
        view.addGestureRecognizer(generalTapGesture)
        ImageView.isUserInteractionEnabled = true
        let zoomGesture = UIPinchGestureRecognizer(target: self, action: #selector(nextZoom(sender:)))
        ImageView.addGestureRecognizer(zoomGesture)
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        ImageView.image = UIImage(named: images[pageControl.currentPage])
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc func nextZoom(sender: UIPinchGestureRecognizer) {
        ImageView.transform = ImageView.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1.0
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//    fileprivate func viewPhotoCommentController(index: Int) -> PhotoCommentViewController? {
//      if let storyboard = storyboard,
//        let page = storyboard.instantiateViewController(withIdentifier: "PhotoCommentViewController")
//          as? PhotoCommentViewController {
//        page.photoName = images[index]
//        page.photoIndex = index
//        return page
//      }
//
//      return nil
//    }
//}
}

extension Selector {
    static let generalTap = #selector(PhotoCommentViewController.dismissKeyboard)
}

//extension PhotoCommentViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        if let viewController = viewController as? PhotoCommentViewController {
//          guard let index = viewController.photoIndex, index != 0 else {
//            return nil
//          }
//          return viewPhotoCommentController(index: index - 1)
//        }
//        return nil
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//         if let viewController = viewController as? PhotoCommentViewController {
//             guard let index = viewController.photoIndex, index != images.count - 1 else {
//               return nil
//             }
//             return viewPhotoCommentController(index: index + 1)
//           }
//           return nil
//    }
//
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//       return images.count
//     }
//
//}
