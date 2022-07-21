#
# Be sure to run `pod lib lint FANOCBaseConfig.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FANOCBaseConfig'
  s.version          = '0.1.8'
  s.summary          = 'A short description of FANOCBaseConfig.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MMSuperD/FANOCBaseConfig'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MMSuperD' => 'shdjxywd@sina.com' }
  s.source           = { :git => 'https://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@github.com/MMSuperD/FANOCBaseConfig.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  
  # 这个是子组件
#  s.subspec 'FAN_ConstFile' do |ss|
#      ss.source_files = 'FANOCBaseConfig/Classes/FAN_ConstFile/**/*'
#  end
#
#  s.subspec 'FAN_Controller' do |ss|
#      ss.source_files = 'FANOCBaseConfig/Classes/FAN_Controller/**/*'
#  end
#
#  s.subspec 'FAN_Extension' do |ss|
#      ss.source_files = 'FANOCBaseConfig/Classes/FAN_Extension/**/*'
#  end
#
#  s.subspec 'FAN_View' do |ss|
#      ss.source_files = 'FANOCBaseConfig/Classes/FAN_View/**/*'
#  end

  s.source_files = 'FANOCBaseConfig/Classes/**/*'
  
#   s.resource_bundles = {
#     'FANOCBaseConfig' => ['FANOCBaseConfig/Assets/*.png']
#   }
  
  s.resource_bundles = {
      'FANOCBaseConfig' => ['FANOCBaseConfig/Assets/**/*.{xcassets,txt,png,xib,nib,plist,xcdatamodel,mom,json,salite,yaml,zip,html,css,js,sql,xml,dat,ini,pem,gif,lproj}']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Masonry', '~> 1.1.0'
  s.dependency 'MJRefresh', '~> 3.7.5'

end
