//
//  Colors.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit.UIColor

extension UIColor {
    
    struct Cell {
        static var actionSheetItem: UIColor { return UIColor(named: "MessageTableViewCellContainer")! }        
    }
    
    struct Label {
        
        static var title: UIColor { return UIColor(named: "Title")! }
        
        static var subtitle: UIColor { return UIColor(named: "Subtitle")! }
        
        static var light: UIColor { return UIColor(named: "Light")! }
    }
}

