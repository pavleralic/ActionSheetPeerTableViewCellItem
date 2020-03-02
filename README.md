# ActionSheetPeerTableViewCellItem

[![Version Status](https://img.shields.io/cocoapods/v/ActionSheetPeerTableViewCellItem.svg)](https://cocoapods.org/pods/ActionSheetPeerTableViewCellItem)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![license MIT](https://img.shields.io/cocoapods/l/ActionSheetPeerTableViewCellItem.svg)](http://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/cocoapods/p/ActionSheetPeerTableViewCellItem.svg)](https://cocoapods.org/pods/ActionSheetPeerTableViewCellItem)

![ActionSheetPeerTableViewCellItem](ScreenShots/AlertSheetExamplePreview.gif "ActionSheetPeerTableViewCellItem")

## About

`UITableViewCell` with support for:

## Requirements

- iOS 10.0+
- Xcode 11.0+
- Swift 5.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate ActionSheetPeerTableViewCellItem into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'ActionSheetPeerTableViewCellItem', '~> 0.0.4'
end
```

Then, run the following command:

```bash
$ pod install
```
### Manually

If you prefer not to use either of the dependency managers, you can integrate ActionCell into your project manually.

## Example

Open the example project, build and run.

## Protocols

### ActionSheetTableViewCellDelegate

```swift
public protocol ActionSheetTableViewCellDelegate: NSObjectProtocol {

    /// An array of `ActionSheetItem` objects representing the actions for the row. Each action you provide is used to create a table view cell that the user can tap.
    func tableView(_ tableView: UITableView, editActionSheetItemsForRowAt indexPath: IndexPath) -> [ActionSheetItem]?
    
    /// A `ActionSheetOptions` instance which configures the behavior and appearance of the elements in `ActionSheetViewController`.
    func tableView(_ tableView: UITableView, editActionSheetOptionsForRowAt indexPath: IndexPath) -> ActionSheetOptions?
    
    func tableView(_ tableView: UITableView, willBeginPresentingActionSheetForRowAt indexPath: IndexPath)
}
```

## Usage

* ActionSheetTableViewCell

```swift
class YourCustomTableViewCell: ActionSheetTableViewCell {

    override var longPressGestureAndOnActionSheetFocusedView: UIView { return someContainerSubviewOfYourCustomTableViewCell }
}
```

* ActionSheetTableViewCellDelegate

```swift
extension ViewController: ActionSheetTableViewCellDelegate {

    func tableView(_ tableView: UITableView, editActionSheetItemsForRowAt indexPath: IndexPath) -> [ActionSheetItem]? {
        ...
    }
}
```

* Set to your YourCustomTableViewCell ActionSheetTableViewCellDelegate

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

  //`YourCustomTableViewCell` is subclass of `ActionSheetTableViewCell`
  let cell = tableView.dequeueReusableCell(withIdentifier: "reuseId") as! YourCustomTableViewCell

  //setup cell...

  // set `ActionSheetTableViewCellDelegate` to cell
  cell.dataProviderProtocol = self

  return cell
}
```


