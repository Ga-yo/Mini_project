//
//  InterestCollectionViewCell.swift
//  10_interests
//
//  Created by 이가영 on 2020/03/20.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    //MARK: Public API
    var interest: Interest! {
        didSet{
            updateUI()
        }
    }
    // MARK: - Private
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    func updateUI(){
        interestTitleLabel?.text = interest.title
        featuredImageView?.image = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
}
