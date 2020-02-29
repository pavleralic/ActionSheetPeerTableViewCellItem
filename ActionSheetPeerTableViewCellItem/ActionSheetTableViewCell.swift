//
//  ActionSheetTableViewCell.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit.UITableViewCell

open class ActionSheetTableViewCell: UITableViewCell {

    /// The view on long press gesture recognizer is setted. ActionSheet will be coordinated by its frame by default.
    ///
    /// - note: It needs to be overriden by child UITableViewCell class for better appearance of ActionSheet or at least `actionSheetMinXAxis` needs to be customly set.
    open var longPressGestureAndOnActionSheetFocusedView: UIView { return contentView }
    
    /// If you do not override `longPressGestureAndOnActionSheetFocusedView`, you can customly set ActionSheet coordinates. By default it uses minimum xAxis.
    open var actionSheetMinXAxis: CGFloat { return longPressGestureAndOnActionSheetFocusedView.frame.minX }
    
    open var actionSheetMaxXAxis: CGFloat { return UIScreen.main.bounds.width - 15.0 }
    
    open var snapshotView: UIView { return contentView }
    
    public weak var dataProviderProtocol: ActionSheetTableViewCellDelegate?
    
    private weak var tableView: UITableView?
    
    private var indexPath: IndexPath? {
        return tableView?.indexPath(for: self)
    }
    
    private var snapshot: UIView {
        
        // When presenting snapshot, background needs to be transparent for better appearance
        // This is achived by changing contentView background color to clear
        let previousContentViewBackgroundColor = contentView.backgroundColor // here is stored previous background color
                
        contentView.backgroundColor = .clear
        
        let snapshot: UIView = snapshotView.snapshotView(afterScreenUpdates: true)!
        
        // After taking snapshot contentView background is changed to previuos setted
        contentView.backgroundColor = previousContentViewBackgroundColor
        
        snapshot.backgroundColor = .clear
        
        return snapshot
    }
    
    private var isActionSheetPresented: Bool = false {
        didSet {
            self.contentView.alpha = isActionSheetPresented ? 0 : 1
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        setupLongPressAction()
    }
    
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()

        var view: UIView = self
        
        while let superview = view.superview {
            view = superview

            if let tableView = view as? UITableView {
                self.tableView = tableView
                return
            }
        }
    }
    
    private func setupLongPressAction() {
        longPressGestureAndOnActionSheetFocusedView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGestureRecognizer)))
    }
    
    @objc private func handleLongPressGestureRecognizer(_ sender: UILongPressGestureRecognizer) {
        
        switch sender.state {
        case .began:
            
            guard
                let indexPath = indexPath,
                let tableView = tableView,
                let actionSheetItems = dataProviderProtocol?.tableView(tableView, editActionSheetItemsForRowAt: indexPath),
                !actionSheetItems.isEmpty,
                let viewControllerToPresentActionSheetOn = tableView.findViewController()
                else { return }
            
            let options = dataProviderProtocol?.tableView(tableView, editActionSheetOptionsForRowAt: indexPath) ?? ActionSheetOptions()
            
            dataProviderProtocol?.tableView(tableView, willBeginPresentingActionSheetForRowAt: indexPath)
            
            let vc = ActionSheetViewController(tableView: tableView,
                                               actionSheetItems: actionSheetItems,
                                               options: options,
                                               snapshot: snapshot,
                                               indexPath: indexPath,
                                               transitionProtocol: self,
                                               actionSheetMinXAxis: actionSheetMinXAxis,
                                               actionSheetMaxXAxis: actionSheetMaxXAxis)
            
            vc.modalPresentationStyle = .overFullScreen

            viewControllerToPresentActionSheetOn.present(vc, animated: false) { [weak self] in
                self?.isActionSheetPresented = true
            }
            
        default:
            break
        }
    }
}

extension ActionSheetTableViewCell: AlertSheetViewControllerTransitionProtocol {
    func didFinishAnimatingAlertSheetDismiss() {
        isActionSheetPresented = false
    }
}

fileprivate extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
