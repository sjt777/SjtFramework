#
# Be sure to run `pod lib lint SjtFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SjtFramework'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SjtFramework.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/sunjiting/SjtFramework'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sunjiting' => '997152370@qq.com' }
  s.source           = { :git => 'https://github.com/sunjiting/SjtFramework.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.swift_version = '5.0'


  s.source_files = 'SjtFramework/Classes/**/*'

  s.public_header_files = 'SjtFramework/Classes/Public/**/*.swift'
  

  s.resource_bundles = {
    'SjtFramework' => ['SjtFramework/Assets/**/*']
  }


  # s.source_files = 'SjtFramework/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SjtFramework' => ['SjtFramework/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.dependency 'Kingfisher'
  s.dependency 'IQKeyboardManagerSwift', '6.3.0'
  s.dependency 'ActiveLabel'
  
  s.dependency 'SGQRCode', '4.1.0'
  s.dependency 'Masonry'
  
  s.dependency 'ThingSmartHomeKit', '2.0.0-cube.1'
  s.dependency 'ThingCameraSDK', '4.4.2-cube.1'
  s.dependency 'ThingCameraUIKit','5.0.1'
  s.dependency 'ThingOpenSSLSDK','1.1.1-s.1'
  s.dependency 'ThingAvLoggerSDK','1.2.5'
  s.dependency 'ThingVideoCodecSDK','1.3.5'
  s.dependency 'ThingP2PSDK','3.4.40'
  s.dependency 'ThingFFmpegWrapper','4.4.2'
  s.dependency 'ThingAudioEngineSDK','1.2.5'
  s.dependency 'ThingSmartAVBaseKit','2.0.1'
  s.dependency 'ThingSmartMediaServices','2.0.0'
  s.dependency 'ThingSmartMediaUIKit','2.0.0'
  s.dependency 'ThingSmartCameraExtSDK','1.0.1'
  s.dependency 'ThingSmartP2pChannelKit','5.0.0'
  s.dependency 'ThingSmartCameraBase','5.5.2'
  s.dependency 'ThingSmartCameraM','5.5.8-cube.1'
  s.dependency 'ThingSmartCameraKit','5.5.3-cube.3'
  


end
