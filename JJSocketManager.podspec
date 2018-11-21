#
# Be sure to run `pod lib lint JJSocketManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JJSocketManager'
  s.version          = '0.1.1'
  s.summary          = 'Swift Socket： include websocket、socket'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/snailjj/JJSocketManager'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'snailjj' => 'snail5jj@hotmail.com' }
  s.source           = { :git => 'https://github.com/snailjj/JJSocketManager.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  
  s.subspec 'Socket' do |st|
      st.source_files = 'JJSocketManager/Socket/*.swift'
      st.dependency 'CocoaAsyncSocket'
  end


  
  # s.resource_bundles = {
  #   'JJSocketManager' => ['JJSocketManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
