//
//  Date.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import Foundation

extension Date {
    
    static var is24HourTimeFormatSetted: Bool = false
    
    static func getFormmatedTime(forTimeInSeconds pubDate: Int) -> String {
        
        let numberOfSecondsPassedSincePubDate = Int(Date().timeIntervalSince1970) - pubDate
        
        switch numberOfSecondsPassedSincePubDate {
        case 0..<60:
            return String.Date.justNow
        case 60..<120:
            return String.Date.aMinuteAgo
        case 120..<3600:
            return String.Date.numberOfMinutesAgo(date: "\(numberOfSecondsPassedSincePubDate/60)")
        case 3600..<7200:
            return String.Date.oneHourAgo
        case 7200..<86400:
            return String.Date.numberOfHoursAgo(date: "\(numberOfSecondsPassedSincePubDate/3600)")
        case 86400..<518400:
            return DateFormatter.pastWeekDate.string(from: Date(timeIntervalSince1970: Double(pubDate)))
        case 86400..<26000000:
            return DateFormatter.pastYearDate.string(from: Date(timeIntervalSince1970: Double(pubDate)))
        default:
            return DateFormatter.common.string(from: Date(timeIntervalSince1970: Double(pubDate)))
        }
    }
}
