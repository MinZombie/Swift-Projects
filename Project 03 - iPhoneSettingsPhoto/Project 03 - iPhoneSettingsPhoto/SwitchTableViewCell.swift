//
//  SwitchTableViewCell.swift
//  Project 03 - iPhoneSettingsPhoto
//
//  Created by meister on 2021/05/06.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let cellSwitch = UISwitch(frame: .zero)
        self.accessoryView = cellSwitch
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
