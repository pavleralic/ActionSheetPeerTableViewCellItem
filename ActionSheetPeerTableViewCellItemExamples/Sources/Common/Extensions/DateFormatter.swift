//
//  DateFormatter.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import Foundation

extension DateFormatter {

    fileprivate static func getFormatter(forDateFormat dateFormat: String) -> DateFormatter {
        let constructor = DateFormatter()
        constructor.dateFormat = dateFormat
        return constructor
    }
    
    static let pastYearDate: DateFormatter = {
        return getFormatter(forDateFormat: "dd.MMM")
    }()

    static let common: DateFormatter = {
        return getFormatter(forDateFormat: "dd.MMM.yyyy.")
    }()

    static let timeFormat: String = {
        return Date.is24HourTimeFormatSetted ? "HH:mm" : "h:mm a"
    }()

    static let pastWeekDate: DateFormatter = {
        return getFormatter(forDateFormat: "EEE 'at' \(timeFormat)")
    }()
}
