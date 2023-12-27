//
//  ColorTableViewCell.swift
//  DontBreakTheChain
//
//  Created by Yiğithan Sönmez on 24.12.2023.
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    
    static let identifier = "ColorTableViewCell"
    
    var onColorSelected: ((UIColor) -> Void)?
    
    @IBOutlet var buttons:[UIButton]!
    
    static func nib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for (index, button) in buttons.enumerated() {
            button.tag = index + 1
            button.addTarget(self, action: #selector(colorButtonTapped(_:)), for: .touchUpInside)
        }
    }
    
    @objc func colorButtonTapped(_ sender: UIButton){
        removeAllCheckmarks()
        sender.configuration?.image = UIImage(systemName: "checkmark")
        print(sender.tag)
        
        switch sender.tag {
        case 1:
            onColorSelected?(.systemPink)
        case 2:
            onColorSelected?(.systemOrange)
        case 3:
            onColorSelected?(.systemBlue)
        case 4:
            onColorSelected?(.systemYellow)
        case 5:
            onColorSelected?(.systemPurple)
        case 6:
            onColorSelected?(.systemGreen)
        default:
            break
        }
    }
    
    func removeAllCheckmarks(){
        for button in buttons {
            button.configuration?.image = nil
        }
    }
    
}
