//
//  UIFont.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit.UIFont

extension UIFont {
    
    enum type {
        case light,regular,medium,bold
    }
    
    static func getFont(_ type: type, size: CGFloat) -> UIFont {
        switch type {
        case .light:
            return UIFont(name: "HelveticaNeue-Light", size: size)!
        case .regular:
            return UIFont(name: "HelveticaNeue", size: size)!
        case .medium:
            return UIFont(name: "HelveticaNeue-Medium", size: size)!
        case .bold:
            return UIFont(name: "HelveticaNeue-Bold", size: size)!
        }
    }
}
