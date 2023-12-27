//
//  UITableView+Extensions.swift
//  DontBreakTheChain
//
//  Created by Yiğithan Sönmez on 24.12.2023.
//

import Foundation
import UIKit

extension UITableView{
    
    /// TableView.indexPath resets in every section. This method calculates index that increase when a new element pushed to the table
    ///[StackOverflow Discussion](https://stackoverflow.com/questions/25846111/indexpath-row-keeps-resetting-after-i-introduced-sections)
    func absoluteIndex(for indexPath: IndexPath, _ numberOfRowsInSections: [Int]) -> Int {
        var absoluteIndex = 0
        
        for section in 0..<indexPath.section {
            absoluteIndex += numberOfRowsInSections[section]
        }
        
        absoluteIndex += indexPath.row
        return absoluteIndex
    }
}
