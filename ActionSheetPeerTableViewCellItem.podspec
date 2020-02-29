Pod::Spec.new do |spec|

  spec.name         = "ActionSheetPeerTableViewCellItem"
  spec.version      = "0.0.3"
  spec.summary      = "A CocoaPods library written in Swift"

  spec.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC

  spec.homepage     = "https://github.com/pavleralic/ActionSheetPeerTableViewCellItem"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "pavleralic" => "pavle.ralic@gmail.com" }

  spec.ios.deployment_target = "10.0"
  spec.swift_version = "5.0"

  spec.source        = { :git => "https://github.com/pavleralic/ActionSheetPeerTableViewCellItem.git", :tag => "#{spec.version}" }
  spec.source_files  = "ActionSheetPeerTableViewCellItem/**/*.{h,m,swift}"

end