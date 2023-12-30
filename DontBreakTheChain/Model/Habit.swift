//
//  Habit.swift
//  DontBreakTheChain
//
//  Created by Yiğithan Sönmez on 20.12.2023.
//

import Foundation
import UIKit

enum Day {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

struct Habit {
    var habitName: String
    var habitDescription: String
    var habitColor: UIColor?
    var totalProgress: Int
    var streakDays: [StreakDay]
    
//    var reminderActive: Bool
//    var remindTime: String // change type to time 21:30
//    var remindDays: [Day]
    
}

struct StreakDay {
    var progress: Int
    let habitDate: DateComponents
    
}
