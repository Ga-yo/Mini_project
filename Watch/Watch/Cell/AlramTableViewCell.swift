//
//  AlramTableViewCell.swift
//  Watch
//
//  Created by 이가영 on 2020/05/07.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class AlramTableViewCell: UITableViewCell {

    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var onoffAlram: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
