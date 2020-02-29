//
//  UITableView.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit.UITableView
import ActionSheetPeerTableViewCellItem

extension UITableView {

    func dequeueReusableCell(withModel model: CellViewAnyModel?, for indexPath: IndexPath, actionSheetDelegate: ActionSheetTableViewCellDelegate?) -> UITableViewCell {

        guard
            let model = model,
            let cell = dequeueReusableCell(withIdentifier: model.identifier, for: indexPath) as? ActionSheetTableViewCell else { return UITableViewCell() }

        model.setupDefault(on: cell)

        cell.dataProviderProtocol = actionSheetDelegate

        return cell
    }
}
