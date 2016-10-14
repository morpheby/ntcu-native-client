
source 'https://github.com/CocoaPods/Specs.git'

project 'ntcu-native-client/ntcu-native-client.xcodeproj'
workspace 'ntcu-native-client.xcworkspace'

# Uncomment the next line to define a global platform for your project
platform :osx, '10.12'
swift_version = "3.0"

target 'ntcu-native-client' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ntcu-native-client
  pod 'SwiftGen'
  pod 'Stencil'
  pod "PromiseKit", "~> 4.0"
  pod 'Upsurge'
  pod 'CustomSegue'

  target 'ntcu-native-clientTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ntcu-native-clientUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

# Fix as per https://github.com/CocoaPods/CocoaPods/issues/5334#issuecomment-223444937
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
    end
  end
end

