//
//  MessagesViewController.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit.UITableViewController
import ActionSheetPeerTableViewCellItem

class MessagesViewController: UITableViewController {
    
    //MARK: - Constants
    let viewModel = MessagesViewModel()
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
//        //`MessageTableViewCell` is subclass of `ActionSheetTableViewCell`
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as! MessageTableViewCell
//
//        //setup cell...
//
//        // set `ActionSheetTableViewCellDelegate` to cell
//        cell.dataProviderProtocol = self
//
//        return cell
        
        return tableView.dequeueReusableCell(withModel: viewModel.model(at: indexPath), for: indexPath, actionSheetDelegate: self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    @IBAction func presentModally(_ sender: UIBarButtonItem) {
        
        // You can test appearance of snapshot and action sheet when presented from popover, transparent navigationbar, largeTitles etc.
        let messagesViewController = MessagesViewController.storyboardInstance(name: .main)!
        
        let navigationController = UINavigationController(rootViewController: messagesViewController)
        
        navigationController.navigationBar.isTranslucent = false
        
        present(navigationController, animated: true, completion: nil)
    }
}

extension MessagesViewController: ActionSheetTableViewCellDelegate {
    
//    func tableView(_ tableView: UITableView, willBeginPresentingActionSheetForRowAt indexPath: IndexPath) {
//
//    }
    
//    func tableView(_ tableView: UITableView, editActionSheetOptionsForRowAt indexPath: IndexPath) -> ActionSheetOptions? {
//
//        var options = ActionSheetOptions()
//
//        options.snapshotAnimationDuration = 0.3
//        options.snapshotAnimationSpringDamping = 0.85
//        options.snapshotAnimationSpringVelocity = 10/3
//        //...
//        options.actionSheetAnimationDuration = 0.25
//        options.actionSheetAnimationDelay = 0.1
//        options.actionSheetAnimationSpringDamping = 0.85
//        options.actionSheetAnimationSpringVelocity = 4
//        //...
//        options.snapshotDismissAnimationDuration = 0.3
//        options.snapshotDismissAnimationDelay = 0.05
//        options.snapshotDismissAnimationSpringDamping = 0.85
//        options.snapshotDismissAnimationSpringVelocity = 10/3
//        //...
//        options.actionSheetDismissAnimationDuration = 0.25
//        options.actionSheetDismissAnimationSpringDamping = 0.85
//        options.actionSheetDismissAnimationSpringVelocity = 4
//
//        return options
//    }
    
    func tableView(_ tableView: UITableView, editActionSheetItemsForRowAt indexPath: IndexPath) -> [ActionSheetItem]? {
        
        var actions: [ActionSheetItem] = []
        
        actions.append(ActionSheetItem(title: String.AlertSheetItemActions.reply,
                                       titleColor: UIColor.Label.title,
                                       titleFont: nil,
                                       image: UIImage.AlertSheetActions.reply,
                                       imageTint: UIColor.Label.title,
                                       backgroundColor: UIColor.Cell.actionSheetItem) {
                                        print(String.Logs.startReplyAction)
        })
        
        actions.append(ActionSheetItem(title: String.AlertSheetItemActions.copy,
                                       titleColor: UIColor.Label.title,
                                       titleFont: nil,
                                       image: UIImage.AlertSheetActions.copy,
                                       imageTint: UIColor.Label.title,
                                       backgroundColor: UIColor.Cell.actionSheetItem) {
                                        print(String.Logs.startCopyAction)
        })
        
        actions.append(ActionSheetItem(title: String.AlertSheetItemActions.pin,
                                       titleColor: UIColor.Label.title,
                                       titleFont: nil,
                                       image: UIImage.AlertSheetActions.pin,
                                       imageTint: UIColor.Label.title,
                                       backgroundColor: UIColor.Cell.actionSheetItem) {
                                        print(String.Logs.startPinAction)
        })
        
        actions.append(ActionSheetItem(title: String.AlertSheetItemActions.delete,
                                       titleColor: UIColor.red,
                                       titleFont: nil,
                                       image: UIImage.AlertSheetActions.delete,
                                       imageTint: UIColor.red,
                                       backgroundColor: UIColor.Cell.actionSheetItem) {
                                        print(String.Logs.startDeleteAction)
        })
        
        return actions
    }
}
