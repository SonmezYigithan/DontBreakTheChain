//
//  HabitTableViewCell.swift
//  DontBreakTheChain
//
//  Created by Yiğithan Sönmez on 21.12.2023.
//

import UIKit

class HabitTableViewCell: UITableViewCell {

    static let identifier: String = "HabitTableViewCell"
    
    @IBOutlet var habitName: UILabel!
    @IBOutlet var habitDescription: UILabel!
    @IBOutlet var cardBackground: UIView! {
        didSet {
            cardBackground.layer.cornerRadius = 20
            cardBackground.layer.borderColor = UIColor.white.cgColor
            cardBackground.clipsToBounds = true
            cardBackground.layer.backgroundColor = UIColor.green.cgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure (with habit: Habit) {
        habitName.text = habit.habitName
        habitDescription.text = habit.habitDescription
        cardBackground.backgroundColor = habit.habitColor ?? .lightGray
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
