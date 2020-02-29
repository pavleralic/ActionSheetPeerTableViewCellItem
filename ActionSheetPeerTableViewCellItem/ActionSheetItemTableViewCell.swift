//
//  ActionSheetItemTableViewCell.swift
//  ActionSheetPeerTableViewCellItem
//
//  Created by Pavle Ralic on 2/29/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit.UITableViewCell

class ActionSheetItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    // Icon ImageView constrains are used for customising its size via AlertSheetOptions
    @IBOutlet weak var iconImageViewWidthConstraint: NSLayoutConstraint!
        
    @IBOutlet weak var iconImageViewHeightConstraint: NSLayoutConstraint!
}
