//
//  CustomLabels.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit.UILabel

class CustomLabel: UILabel {
    
    // MARK: - Lifecycle
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.commonInit()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    func commonInit() {
        textColor = UIColor.Label.light
        font = UIFont.getFont(.regular, size: 13.0)
    }
}

class TitleLabel: CustomLabel {
    // MARK: - Lifecycle
    override func commonInit() {
        textColor = UIColor.Label.title
        font = UIFont.getFont(.medium, size: 15.0)
    }
}

class SubtitleLabel: CustomLabel {
    // MARK: - Lifecycle
    override func commonInit() {
        textColor = UIColor.Label.subtitle
        font = UIFont.getFont(.regular, size: 14.0)
    }
}

class LightSubtitleLabel: CustomLabel {
    // MARK: - Lifecycle
    override func commonInit() {
        textColor = UIColor.Label.light
        font = UIFont.getFont(.regular, size: 13.0)
    }
}
