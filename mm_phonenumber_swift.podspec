#
# Be sure to run `pod lib lint mm_phonenumber_swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'mm_phonenumber_swift'
  s.version          = '1.0.0'
  s.summary          = 'A swift port of mm_phonenumber validator'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
PHP port of mm_phonenumber to check valid myanmar mobile numbers, get mobile operator's name, sanitize mobile numbers and get mobile network types.
                       DESC

  s.homepage         = 'https://github.com/wailynn-wlz/mm_phonenumber_swift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wailynnzaw' => 'wailynnzaw@owaytrip.com' }
  s.source           = { :git => 'https://github.com/wailynn-wlz/mm_phonenumber_swift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/wailynnzaw'

  s.ios.deployment_target = '8.0'

  s.source_files = 'mm_phonenumber_swift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'mm_phonenumber_swift' => ['mm_phonenumber_swift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
