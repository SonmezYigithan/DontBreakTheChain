//
//  InputFieldTableViewCell.swift
//  DontBreakTheChain
//
//  Created by Yiğithan Sönmez on 24.12.2023.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    
    static let identifier = "TextFieldTableViewCell"
    
    static func nib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
