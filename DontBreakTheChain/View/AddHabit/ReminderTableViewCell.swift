//
//  ReminderTableViewCell.swift
//  DontBreakTheChain
//
//  Created by Yiğithan Sönmez on 24.12.2023.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {
    
    static let identifier = "ReminderTableViewCell"
    
    static func nib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
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
