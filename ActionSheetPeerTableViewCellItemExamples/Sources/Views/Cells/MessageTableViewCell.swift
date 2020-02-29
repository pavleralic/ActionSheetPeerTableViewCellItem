//
//  MessageTableViewCell.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit.UITableViewCell
import ActionSheetPeerTableViewCellItem

class MessageTableViewCell: ActionSheetTableViewCell {
    
    //MARK: - Parent public variables
    override var longPressGestureAndOnActionSheetFocusedView: UIView { return messageContainerView }
    
    /**
     override var snapshotView: UIView { return messageContainerView }
     
     override var actionSheetMaxXAxis: CGFloat { return self.frame.midX }
         
     override var actionSheetMinXAxis: CGFloat { return userProfileImageView.frame.minY }
     */
    
    //MARK: - IBOutlets
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    @IBOutlet weak var userFullNameLabel: TitleLabel!
    
    @IBOutlet weak var messageContainerView: UIView!
    
    @IBOutlet weak var commentLabel: SubtitleLabel!
    
    @IBOutlet weak var dateLabel: LightSubtitleLabel!
}
