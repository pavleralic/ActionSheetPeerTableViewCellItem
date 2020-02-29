//
//  ActionSheetTableViewCellDelegate.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit

/**
 The `ActionSheetTableViewCellDelegate` protocol is adopted by an object that manages the display of action buttons when the cell is swiped.
 */

public protocol ActionSheetTableViewCellDelegate: NSObjectProtocol {
    
    /**
     Asks the delegate for the actions to display in response to a long press gesture in the specified row.
     
     - parameter tableView: The table view object which owns the cell requesting this information.
     
     - parameter indexPath: The index path of the row.          
     
     - returns: An array of `ActionSheetItem` objects representing the actions for the row. Each action you provide is used to create a table view cell that the user can tap.  Returning `nil` will prevent presenting `ActionSheetViewController`.
     */
    func tableView(_ tableView: UITableView, editActionSheetItemsForRowAt indexPath: IndexPath) -> [ActionSheetItem]?
    
    /**
    Asks the delegate for the display options to be used while presenting the `ActionSheetViewController`.
    
    - parameter tableView: The table view object which owns the cell requesting this information.
    
    - parameter indexPath: The index path of the row.
    
    - returns: A `ActionSheetOptions` instance which configures the behavior and appearance of the elements in `ActionSheetViewController`.
    
    - note: If not implemented, a default `ActionSheetOptions` instance is used.
    */
    func tableView(_ tableView: UITableView, editActionSheetOptionsForRowAt indexPath: IndexPath) -> ActionSheetOptions?
    
    /**
     Tells the delegate that the table view is about to go into editing mode.

     - parameter tableView: The table view object providing this information.
     
     - parameter indexPath: The index path of the row.
    */
    func tableView(_ tableView: UITableView, willBeginPresentingActionSheetForRowAt indexPath: IndexPath)
}

/**
 Default implementation of `ActionSheetTableViewCellDelegate` methods
 */
public extension ActionSheetTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, willBeginPresentingActionSheetForRowAt indexPath: IndexPath) { }
    
    func tableView(_ tableView: UITableView, editActionSheetOptionsForRowAt indexPath: IndexPath) -> ActionSheetOptions? {
        return ActionSheetOptions()
    }
}
