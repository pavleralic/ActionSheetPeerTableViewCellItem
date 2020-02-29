//
//  ActionSheetItem.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/28/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit.UIColor
import UIKit.UIImage

/**
The `ActionSheetItem` defines a single action to present when the user long presses over `ActionSheetTableViewCell` in a table.

This class lets you define one or more custom actions to display for a given item in your table. Each instance of this class represents a single action to perform and includes the text, formatting information, and behavior for the corresponding button.
*/
public struct ActionSheetItem {
    
    /// The title of the label.
    ///
    /// - note: You must specify a title.
    public let title: String
    
    /// The color of the label title.
    public let titleColor: UIColor
    
    /// The font to use for the title of the label.
    ///
    /// - note: If font is not specified, a 16pt helvetica font is used.
    public let titleFont: UIFont?
    
    /// The image of the image view.
    ///
    /// - note: It is optional, but item looks much better with it.
    public let image: UIImage?
    
    /// The optional color of the image view rendered image.
    public let imageTint: UIColor?
    
    /// The color of the table view cell background.
    public let backgroundColor: UIColor
    
    /// The closure to execute when the user taps the table view cell associated with this action.
    public var completion: (() -> Void)?
    
    /**
     Constructs a new `ActionSheetItem` instance.
     
     - parameter title: The title of  label.
     - parameter titleColor: The color of the label title.
     - parameter titleFont: The font to use for the title of the label.
     - parameter image: The image of the image view.
     - parameter imageTint: The optional color of the image view rendered image.
     - parameter backgroundColor: The color of the table view cell background.
     - parameter completion: The closure to execute when the user taps the table view cell associated with this action.
    */
    public init(title: String, titleColor: UIColor, titleFont: UIFont?, image: UIImage?, imageTint: UIColor? = nil, backgroundColor: UIColor, completion: (() -> Void)?) {
        self.title = title
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.image = image
        self.imageTint = imageTint
        self.backgroundColor = backgroundColor
        self.completion = completion
    }
}
