//
//  ViewController.swift
//  9_PhotoScroll
//
//  Created by 이가영 on 2020/03/16.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

var images = ["올라프1.jpeg", "올라프2.jpeg", "올라프3.jpeg", "올라프4.jpeg", "올라프5.jpeg", "올라프6.jpeg"]

class ViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    let thumbnailSize: CGFloat = 70.0
    let sectionInsets = UIEdgeInsets(top: 10, left: 5.0, bottom: 10.0, right: 5.0)
    override func viewDidLoad() {
        super.viewDidLoad()

        collection.delegate = self
        collection.dataSource = self
        title = "PhtoScroll"
        collection.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
          let indexPath = collection?.indexPath(for: cell),
          let photoCommentViewController = segue.destination as? PhotoCommentViewController {
          photoCommentViewController.photoName = "올라프\(indexPath.row + 1)"
          photoCommentViewController.photoNumber = indexPath.row
        }

    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return images.count
     }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
         let fullsiezImage = UIImage(named: "\(images[indexPath.row])")
        cell.cellImageView.image = fullsiezImage

         return cell
     }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: thumbnailSize, height: thumbnailSize)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      return sectionInsets
    }
}
