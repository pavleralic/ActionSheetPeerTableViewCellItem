//
//  UIViewController.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit.UIViewController

extension UIViewController {
    
    enum StoryboardNames: String {
        case main
    }
    
    private class func mainStoryboardInstancePrivate<T: UIViewController>(name: String) -> T? {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? T
    }

    class func storyboardInstance(name: StoryboardNames) -> Self? {
        return mainStoryboardInstancePrivate(name: name.rawValue.capitalized)
    }
}
