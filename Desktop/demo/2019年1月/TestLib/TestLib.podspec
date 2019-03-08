#
# Be sure to run `pod lib lint SCVideoHallModuleLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Test'
  s.version          = '0.0.2'
  s.summary          = '测试'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '测试测试测试'

  s.homepage         = 'https://github.com/daiyongtao'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DaiYongTao' => '18811508093@163.com' }
  s.source           = { :git => 'https://github.com/daiyongtao/TestLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files  = "TestLib/**/*.{h,m}"

  s.resource_bundles = {
    'ResourceBundle' => ['TestLib/Resource/Image/*.png']
  }

  s.public_header_files = 'TestLib/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'

end
