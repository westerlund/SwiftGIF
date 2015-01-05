#
# Be sure to run `pod lib lint SwiftGIF.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SwiftGIF"
  s.version          = "0.1.0"
  s.summary          = "SwiftGIF is a small tool for creating animated GIFs in Swift"
  s.description      = <<-DESC
                        SwiftGIF is a small nifty tool for creating animated gifs in swift.
                        Just install and call the only method there is.                     
  DESC
  s.homepage         = "https://github.com/westerlund/SwiftGIF"
  s.license          = 'WTFPL'
  s.author           = { "Simon Westerlund" => "s@simonwesterlund.se" }
  s.source           = { :git => "https://github.com/westerlund/SwiftGIF.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/wesslansimon'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'SwiftGIF' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'UIKit', 'ImageIO', 'MobileCoreServices'
end
