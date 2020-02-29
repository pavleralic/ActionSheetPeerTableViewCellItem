//
//  CellViewAnyModel.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit.UIView

// For non-generic cases
protocol CellViewAnyModel {
    static var cellAnyType: UIView.Type { get }
    func setupDefault(on cell: UIView)
    var identifier: String { get }
}

// For generic one and models itselfs
protocol CellViewModel: CellViewAnyModel {
    associatedtype CellType: UIView
    func setup(on cell: CellType)
}

extension CellViewModel {
    static var cellAnyType: UIView.Type {
        return CellType.self
    }
    
    var identifier: String { return String(describing: Self.cellAnyType) }
    
    func setupDefault(on cell: UIView) {
        if let cell = cell as? CellType {
            setup(on: cell)
        } else {
            assertionFailure("Wrong usage")
        }
    }
}
