//
//  MainTableViewCell.swift
//  Project 01 - Dortmund
//
//  Created by meister on 2021/04/24.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImageView.layer.cornerRadius = cellImageView.frame.width / 2
        cellImageView.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
