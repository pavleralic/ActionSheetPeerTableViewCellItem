//
//  String+Date.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import Foundation

extension String {
    
    struct Date {
        
        static var yesterday: String = "Yesterday".localized
        
        static var today: String = "Today".localized
        
        static var tommorrow: String = "Tommorrow".localized
        
        static var justNow: String = "just now".localized
        
        static var aMinuteAgo: String = "a minute ago".localized
        
        static var oneHourAgo: String = "1 hour ago".localized
        
        static var dateNotSetPlaceholder: String = "Not Set_DATE".localized
        
        static func numberOfMinutesAgo(date: String) -> String {
            return "%{TIME_EXPRESSED_IN_MINUTES} minutes ago"
                .localized
                .withSubstitutions(
                    ["TIME_EXPRESSED_IN_MINUTES": date])
        }
        
        static func numberOfHoursAgo(date: String) -> String {
            return "%{TIME_EXPRESSED_IN_HOURS} hours ago"
                .localized
                .withSubstitutions(
                    ["TIME_EXPRESSED_IN_HOURS": date])
        }
    }
}

