//
//  ActionSheetOptions.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/28/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit

/// The `ActionSheetOptions` class provides options for transistion and expansion behavior for `ActionSheetViewController`.
public struct ActionSheetOptions {
    
    /// Space between action sheet and snapshot
    public var spaceBetweenAlertSheetAndSnapshot: CGFloat?
    
    /// Space between action sheet and bottom of window
    public var actionSheetBottomMargin: CGFloat?
    
    /// Action sheet frame width.
    ///
    /// - note: If big width is setted, appearance of alert sheet won't be right. By system default 200.0 is setted.
    public var actionSheetFrameWidth: CGFloat?
    
    /// Action sheet table view cell height.
    public var actionSheetTableViewCellRowHeight: CGFloat?
    
    /// Action sheet table view cell icon image view height.
    ///
    /// - note: If bigger height is setted then `actionSheetTableViewCellRowHeight`, then it won't be executed. By system default 22.0 is setted.
    public var actionSheetItemIconHeightConstraintConstant: CGFloat?
    
    /// Action sheet table view cell icon image view width.
    public var actionSheetItemIconWidthConstraintConstant: CGFloat?
    
    /// Action sheet layer corner radius is setted 10.0pt by default.
    ///
    /// - note: This value should be da same as your targeted container view in table view cell.
    public var actionSheetLayerCornerRadius: CGFloat?
    
    /// An object that applies a blurring effect to the content layered behind a visual effect view.
    public var blurEffectViewStyle: UIBlurEffect.Style?
    
    /// When using the UIVisualEffectView class, avoid alpha values that are less than 1. Creating views that are partially transparent causes the system to combine the view and all the associated subviews during an offscreen render pass. UIVisualEffectView objects need to be combined as part of the content they are layered on top of in order to look correct. Setting the alpha to less than 1 on the visual effect view or any of its superviews causes many effects to look incorrect or not show up at all.
    public var blurEffectViewAlpha: CGFloat?
    
    /// The total duration of the animations, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
    public var blurEffectViewAnimationDuration: TimeInterval?
    
    /// The total duration of the animations, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
    public var blurEffectViewDismissAnimationDuration: TimeInterval?
    
    /// Use impact feedback to indicate that an impact has occurred. For example, you might trigger impact feedback when a user interface object collides with another object or snaps into place.
    public var vibrationImpactFeedbackGeneratorStyle: UIImpactFeedbackGenerator.FeedbackStyle?
        
    /// Snapshot animation appearance configuration
    ///
    /// The total duration of the animations, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
    public var snapshotAnimationDuration: TimeInterval?
    
    /// The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
    public var snapshotAnimationDelay: TimeInterval?
    
    /// The damping ratio for the spring animation as it approaches its quiescent state.
    /// To smoothly decelerate the animation without oscillation, use a value of 1. Employ a damping ratio closer to zero to increase oscillation.
    public var snapshotAnimationSpringDamping: CGFloat?
    
    /// The initial spring velocity. For smooth start to the animation, match this value to the view’s velocity as it was prior to attachment.
    /// A value of 1 corresponds to the total animation distance traversed in one second. For example, if the total animation distance is 200 points and you want the start of the animation to match a view velocity of 100 pt/s, use a value of 0.5.
    public var snapshotAnimationSpringVelocity: CGFloat?
    
    /// A mask of options indicating how you want to perform the animations.
    public var snapshotAnimationOption: UIView.AnimationOptions?

    /// Snapshot animation dismissal configuration
    ///
    /// The total duration of the animations, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
    public var snapshotDismissAnimationDuration: TimeInterval?
    
    /// The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
    public var snapshotDismissAnimationDelay: TimeInterval?
    
    /// The damping ratio for the spring animation as it approaches its quiescent state.
    /// To smoothly decelerate the animation without oscillation, use a value of 1. Employ a damping ratio closer to zero to increase oscillation.
    public var snapshotDismissAnimationSpringDamping: CGFloat?
    
    /// The initial spring velocity. For smooth start to the animation, match this value to the view’s velocity as it was prior to attachment.
    /// A value of 1 corresponds to the total animation distance traversed in one second. For example, if the total animation distance is 200 points and you want the start of the animation to match a view velocity of 100 pt/s, use a value of 0.5.
    public var snapshotDismissAnimationSpringVelocity: CGFloat?
    
    /// A mask of options indicating how you want to perform the animations.
    public var snapshotDismissAnimationOption: UIView.AnimationOptions?
    
    /// Alert sheet animation configuration
    ///
    /// The total duration of the animations, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
    public var actionSheetAnimationDuration: TimeInterval?
    
    /// The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
    public var actionSheetAnimationDelay: TimeInterval?
    
    /// The damping ratio for the spring animation as it approaches its quiescent state.
    /// To smoothly decelerate the animation without oscillation, use a value of 1. Employ a damping ratio closer to zero to increase oscillation.
    public var actionSheetAnimationSpringDamping: CGFloat?
    
    /// The initial spring velocity. For smooth start to the animation, match this value to the view’s velocity as it was prior to attachment.
    /// A value of 1 corresponds to the total animation distance traversed in one second. For example, if the total animation distance is 200 points and you want the start of the animation to match a view velocity of 100 pt/s, use a value of 0.5.
    public var actionSheetAnimationSpringVelocity: CGFloat?
    
    /// A mask of options indicating how you want to perform the animations.
    public var actionSheetAnimationOption: UIView.AnimationOptions?
    
    /// Alert sheet animation dismissal configuration
    ///
    /// The total duration of the animations, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
    public var actionSheetDismissAnimationDuration: TimeInterval?
    
    /// The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
    public var actionSheetDismissAnimationDelay: TimeInterval?
    
    /// The damping ratio for the spring animation as it approaches its quiescent state.
    /// To smoothly decelerate the animation without oscillation, use a value of 1. Employ a damping ratio closer to zero to increase oscillation.
    public var actionSheetDismissAnimationSpringDamping: CGFloat?
    
    /// The initial spring velocity. For smooth start to the animation, match this value to the view’s velocity as it was prior to attachment.
    /// A value of 1 corresponds to the total animation distance traversed in one second. For example, if the total animation distance is 200 points and you want the start of the animation to match a view velocity of 100 pt/s, use a value of 0.5.
    public var actionSheetDismissAnimationSpringVelocity: CGFloat?
    
    /// A mask of options indicating how you want to perform the animations.
    public var actionSheetDismissAnimationOption: UIView.AnimationOptions?
    
    /// Constructs a new `ActionSheetOptions` instance with default options.
    public init() {}
}
