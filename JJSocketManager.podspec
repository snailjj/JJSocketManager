#
# Be sure to run `pod lib lint JJSocketManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JJSocketManager'
  s.version          = '0.2.5'
  s.summary          = 'Swift Socket： include websocket、socket'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.swift_version    = '4.2'
  s.homepage         = 'https://github.com/snailjj/JJSocketManager'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'snailjj' => 'snail5jj@hotmail.com' }
  s.source           = { :git => 'https://github.com/snailjj/JJSocketManager.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.static_framework  =  true

  
    s.subspec 'CocoaSocket' do |cst|
      cst.source_files = 'JJSocketManager/CocoaSocket/*.swift'
#      st.prefix_header_contents = '#import<CocoaAsyncSocket/GCDAsyncSocket.h>'
      cst.dependency 'CocoaAsyncSocket'
    end

    s.subspec 'WebSocketIO' do |wstio|
      wstio.source_files = 'JJSocketManager/WebSocketIO/*.swift'
      wstio.dependency 'Socket.IO-Client-Swift'
    end
    
    s.subspec 'WebSocketRocket' do |wstro|
        wstro.source_files = 'JJSocketManager/WebSocketRocket/*.swift'
        wstro.dependency 'SocketRocket'
    end


  
  # s.resource_bundles = {
  #   'JJSocketManager' => ['JJSocketManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
