#
# Be sure to run `pod lib lint InterstitialAdControllerCocos2d.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "InterstitialAdControllerCocos2d"
  s.version          = "0.1.0"
  s.summary          = "iAD and AdMob interstitial ads for Cocos2d."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                       DESC

  s.homepage         = "https://github.com/heshanlk/InterstitialAdControllerCocos2d"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Heshan Wanigasooriya" => "heshan@heidisoft.com" }
  s.source           = { :git => "https://github.com/heshanlk/InterstitialAdControllerCocos2d.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/heshanlk'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'InterstitialAdControllerCocos2d' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'iAd'
  s.dependency 'Google-Mobile-Ads-SDK', '~> 7.0'
end
