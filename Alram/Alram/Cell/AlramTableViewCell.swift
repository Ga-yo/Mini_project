//
//  AlramTableViewCell.swift
//  Alram
//
//  Created by 이가영 on 2020/05/11.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class AlramTableViewCell: UITableViewCell {

    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var onoffAlram: UISwitch!
    
    
    @IBAction func selectSwitch(_ sender: UISwitch){
        if onoffAlram.isOn{
            clockLabel.textColor = .black
            backgroundColor = .white
        }else{
            clockLabel.textColor = .white
            backgroundColor = .gray
        }
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
