//
//  MessageTableViewCellViewModel.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import Foundation

struct MessageTableViewCellViewModel {
    let message: Message
}

extension MessageTableViewCellViewModel: CellViewModel {
        
    typealias CellType = MessageTableViewCell
    
    func setup(on cell: MessageTableViewCell) {
        
        cell.commentLabel.text = message.comment
        
        cell.userFullNameLabel.text = message.user?.fullname
                
        cell.userProfileImageView.image = message.user?.profilePictureSmallImage
        
        cell.dateLabel.text = Date.getFormmatedTime(forTimeInSeconds: message.pubDate)
    }    
}
