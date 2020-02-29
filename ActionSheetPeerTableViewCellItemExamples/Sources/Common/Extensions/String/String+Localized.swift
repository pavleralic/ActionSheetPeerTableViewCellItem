//
//  Strings.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func withSubstitutions(_ substitutions: [String: String]) -> String {
        return substitutions.reduce(self) { accum, sub in
            accum.replacingOccurrences(of: "%{\(sub.0)}", with: sub.1)
        }
    }
}
