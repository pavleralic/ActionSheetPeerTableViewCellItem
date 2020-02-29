//
//  ActionSheetViewController.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit.UIViewController

protocol AlertSheetViewControllerTransitionProtocol: class {
    func didFinishAnimatingAlertSheetDismiss()
}

class ActionSheetViewController: UIViewController {
    
    //MARK: - Constants
    private let tableView: UITableView
    
    private let actionSheetItems: [ActionSheetItem]
    
    private let options: ActionSheetOptions
    
    private let snapshot: UIView
    
    private let tableViewCellIndexPath: IndexPath
    
    private let actionSheetMinXAxis: CGFloat
    
    private let actionSheetMaxXAxis: CGFloat
    
    private let blurEffectView: UIVisualEffectView = {
        let blurEffectView = UIVisualEffectView()
        blurEffectView.alpha = 0.0
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    
    //MARK: - Variables
    private weak var transitionProtocol: AlertSheetViewControllerTransitionProtocol?
    
    private var startActionSheetTableViewFrame: CGRect!
    
    private var actionSheetTableView: UITableView!
    
    private var startSnapshotFrame: CGRect!
    
    private var minTopEdgeRectInsent: CGFloat!
    
    private var contentContainerView: UIView!
    
    private lazy var actionSheetItemRowHeight: CGFloat = {
        return options.actionSheetTableViewCellRowHeight ?? 44.0
    }()
        
    private lazy var actionSheetTopMargin: CGFloat = {
        return options.spaceBetweenAlertSheetAndSnapshot ?? 12.0
    }()
    
    private lazy var actionSheetBottomMargin: CGFloat = {
        return options.actionSheetBottomMargin ?? 22.0
    }()
    
    private lazy var actionSheetFrameWidth: CGFloat = {
        return options.actionSheetFrameWidth ?? 200.0
    }()
    
    private lazy var actionSheetFrameHeight: CGFloat = {
        return CGFloat(actionSheetItems.count) * actionSheetItemRowHeight
    }()
    
    //MARK: - Init
    init(tableView: UITableView,
         actionSheetItems: [ActionSheetItem],
         options: ActionSheetOptions,
         snapshot: UIView,
         indexPath: IndexPath,
         transitionProtocol: AlertSheetViewControllerTransitionProtocol?,
         actionSheetMinXAxis: CGFloat,
         actionSheetMaxXAxis: CGFloat) {
                
        self.tableView = tableView
        self.actionSheetItems = actionSheetItems
        self.options = options
        self.snapshot = snapshot
        self.tableViewCellIndexPath = indexPath
        self.actionSheetMinXAxis = actionSheetMinXAxis
        self.actionSheetMaxXAxis = actionSheetMaxXAxis
        
        super.init(nibName: nil, bundle: nil)
        
        self.transitionProtocol = transitionProtocol
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        minTopEdgeRectInsent = tableView.convert(tableView.bounds, to: view).minY + tableView.safeAreaInsets.top
        
        setupUI()
        
        setupTableView()
        
        setupGestureRecognizers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Setup snapshot animation
        let actionSheetTableViewTotalHeightWithTopAndBottomMargins: CGFloat = actionSheetFrameHeight + actionSheetTopMargin + actionSheetBottomMargin
        
        let minimumSnapshotFrameMaxY: CGFloat = self.view.frame.height - actionSheetTableViewTotalHeightWithTopAndBottomMargins
        
        let snapshotFrameY: CGFloat
        
        if startSnapshotFrame.maxY > minimumSnapshotFrameMaxY {
            snapshotFrameY = minimumSnapshotFrameMaxY - startSnapshotFrame.height
            
        } else if startSnapshotFrame.minY < minTopEdgeRectInsent {
            
            let snapshotAndActionSheetTableViewWithMarginsTotalHeight: CGFloat = startSnapshotFrame.height + actionSheetTableViewTotalHeightWithTopAndBottomMargins
            
            if snapshotAndActionSheetTableViewWithMarginsTotalHeight > self.view.frame.height {
                snapshotFrameY = self.view.frame.height - snapshotAndActionSheetTableViewWithMarginsTotalHeight
            } else {
                snapshotFrameY = minTopEdgeRectInsent
            }
        } else {
            snapshotFrameY = startSnapshotFrame.minY
        }
        
        let frameForSnapshot: CGRect = CGRect(x: startSnapshotFrame.minX, y: snapshotFrameY, width: startSnapshotFrame.width, height: startSnapshotFrame.height)
        
        UIView.animate(withDuration: options.snapshotAnimationDuration ?? 0.3,
                       delay: options.snapshotAnimationDelay ?? 0.0,
                       usingSpringWithDamping: options.snapshotAnimationSpringDamping ?? 0.85,
                       initialSpringVelocity: options.snapshotAnimationSpringVelocity ?? 10/3,
                       options: [(options.snapshotAnimationOption ?? .curveEaseInOut)],
                       animations: {
                        self.snapshot.frame = frameForSnapshot
        })
        
        // Setup alertSheetTableView animation
        let minimumActionSheetTableViewXAnchorToBeFulfilled: CGFloat = actionSheetMaxXAxis - actionSheetFrameWidth
        
        let finalActionSheetTableViewFrame = CGRect(x: min(minimumActionSheetTableViewXAnchorToBeFulfilled, actionSheetMinXAxis),
                                       y: frameForSnapshot.maxY + actionSheetTopMargin,
                                       width: actionSheetFrameWidth,
                                       height: actionSheetFrameHeight)
        
        startActionSheetTableViewFrame = CGRect(x: finalActionSheetTableViewFrame.minX,
                                     y: finalActionSheetTableViewFrame.midY,
                                     width: actionSheetFrameWidth,
                                     height: 0.0)
        
        actionSheetTableView.frame = startActionSheetTableViewFrame
        
        UIView.animate(withDuration: options.actionSheetAnimationDuration ?? 0.25,
                       delay: options.actionSheetAnimationDelay ?? 0.1,
                       usingSpringWithDamping: options.actionSheetAnimationSpringDamping ?? 0.85,
                       initialSpringVelocity: options.actionSheetAnimationSpringVelocity ?? 4,
                       options: [(options.actionSheetAnimationOption ?? .curveEaseInOut)],
                       animations: {
                        self.actionSheetTableView.frame = finalActionSheetTableViewFrame
        })
        
        // Setup blurEffectView animation
        UIView.animate(withDuration: options.blurEffectViewAnimationDuration ?? 0.3) {
            self.blurEffectView.alpha = self.options.blurEffectViewAlpha ?? 1.0
        }
        
        // Apply vibration
        UIImpactFeedbackGenerator(style: options.vibrationImpactFeedbackGeneratorStyle ?? .medium).impactOccurred()
    }
    
    //MARK: - Private Methods
    
    private func setupUI() {
        
        self.view.backgroundColor = .clear
        
        setupBlurEffect()
        
        setupContainerView()
        
        setupSnapshotStartPosition()
    }
    
    private func setupBlurEffect() {
        
        blurEffectView.effect = UIBlurEffect(style: options.blurEffectViewStyle ?? UIBlurEffect.Style.dark)
        
        blurEffectView.frame = self.view.bounds
        
        self.view.addSubview(blurEffectView)
    }
    
    private func setupContainerView() {
        
        contentContainerView = UIView(frame: self.view.frame)
            
        contentContainerView.backgroundColor = .clear
        
        let maskLayer = CAShapeLayer()
        
        let path = CGPath(rect: CGRect(x: 0.0, y: minTopEdgeRectInsent, width: self.view.frame.width, height: self.view.frame.height - minTopEdgeRectInsent), transform: nil)
        
        maskLayer.path = path

        // Set the mask of the view.
        contentContainerView.layer.mask = maskLayer;
        
        self.view.addSubview(contentContainerView)
    }
    
    private func setupSnapshotStartPosition() {
        
        startSnapshotFrame = tableView.convert(tableView.rectForRow(at: tableViewCellIndexPath), to: self.view)
        
        snapshot.frame = startSnapshotFrame
        
        contentContainerView.addSubview(snapshot)
    }
    
    private func setupTableView() {
        
        actionSheetTableView = UITableView(frame: CGRect.zero, style: .plain)
        
        actionSheetTableView.backgroundColor = .clear
        
        actionSheetTableView.layer.cornerRadius = options.actionSheetLayerCornerRadius ?? 10.0
        
        actionSheetTableView.register(UINib(nibName: "ActionSheetItemTableViewCell",
                                            bundle: Bundle(for: ActionSheetViewController.self)),
                                      forCellReuseIdentifier: "ActionSheetItemTableViewCell")
        
        actionSheetTableView.isScrollEnabled = false
        
        actionSheetTableView.delegate = self
        
        actionSheetTableView.dataSource = self
        
        // Remove space between sections.
        actionSheetTableView.sectionHeaderHeight = 0
        
        // Remove space at top and bottom of tableView.
        actionSheetTableView.tableHeaderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: CGFloat.leastNormalMagnitude)))
        
        // insert tableview
        contentContainerView.addSubview(self.actionSheetTableView)
    }
    
    private func setupGestureRecognizers() {
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissActionSheet))
        
        tapGestureRecognizer.cancelsTouchesInView = false
        
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func dismissActionSheet() {
        
        let group = DispatchGroup()
        
        group.enter()
        UIView.animate(withDuration: options.blurEffectViewDismissAnimationDuration ?? 0.3,
                       animations: {
            self.blurEffectView.alpha = 0.0
        }) { _ in
            group.leave()
        }
        
        group.enter()
        UIView.animate(withDuration: options.snapshotDismissAnimationDuration ?? 0.3,
                       delay: options.snapshotDismissAnimationDelay ?? 0.05,
                       usingSpringWithDamping: options.snapshotDismissAnimationSpringDamping ?? 0.85,
                       initialSpringVelocity: options.snapshotDismissAnimationSpringVelocity ?? (10/3),
                       options: [options.snapshotDismissAnimationOption ?? .curveEaseInOut],
                       animations: {
                        self.snapshot.frame = self.startSnapshotFrame
        }) { _ in
            group.leave()
        }
        
        group.enter()
        UIView.animate(withDuration: options.actionSheetDismissAnimationDuration ?? 0.25,
                       delay: options.actionSheetDismissAnimationDelay ?? 0.0,
                       usingSpringWithDamping: options.actionSheetDismissAnimationSpringDamping ?? 0.85,
                       initialSpringVelocity: options.actionSheetDismissAnimationSpringVelocity ?? 4,
                       options: [options.actionSheetDismissAnimationOption ?? .curveEaseInOut],
                       animations: {
                        
                        self.actionSheetTableView.frame = self.startActionSheetTableViewFrame
                        
                        self.actionSheetTableView.alpha = 0.0
        }) { _ in
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.dismiss(animated: false)
            self.transitionProtocol?.didFinishAnimatingAlertSheetDismiss()
        }
    }
}

extension ActionSheetViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actionSheetItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActionSheetItemTableViewCell", for: indexPath) as! ActionSheetItemTableViewCell
        
        let actionSheetItem = actionSheetItems[indexPath.row]
        
        cell.titleLabel.text = actionSheetItem.title
        cell.titleLabel.textColor = actionSheetItem.titleColor
        cell.titleLabel.font = actionSheetItem.titleFont ?? UIFont(name: "HelveticaNeue", size: 16.0)!

        if let imageTint = actionSheetItem.imageTint {
            cell.iconImageView.image = actionSheetItem.image?.withRenderingMode(.alwaysTemplate)
            cell.iconImageView.tintColor = imageTint
        } else {
            cell.iconImageView.image = actionSheetItem.image
        }        
        
        cell.iconImageViewWidthConstraint.constant = options.actionSheetItemIconWidthConstraintConstant ?? 22.0
        cell.iconImageViewHeightConstraint.constant = min(options.actionSheetItemIconHeightConstraintConstant ?? 22.0, actionSheetItemRowHeight)
        
        cell.contentView.backgroundColor = actionSheetItem.backgroundColor
        
        if actionSheetItems.count - 1 == indexPath.row {
            cell.separatorInset = UIEdgeInsets(top: 0.0, left: CGFloat.greatestFiniteMagnitude, bottom: 0.0, right: 0.0)
        } else {
            cell.separatorInset = UIEdgeInsets.zero
        }
        
        return cell
    }
}

extension ActionSheetViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return actionSheetItemRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        actionSheetItems[indexPath.row].completion?()
    }
}
