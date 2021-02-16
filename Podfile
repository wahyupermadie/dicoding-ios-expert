# Uncomment the next line to define a global platform for your project
# source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/wahyupermadie/dicoding-ios-expert-module-podspec'
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '14.0'
use_frameworks!
workspace 'Modularization'

pod 'Alamofire'
pod 'SDWebImageSwiftUI'
pod 'RealmSwift'
pod 'Resolver'
pod 'SwiftLint'

target 'App' do
  pod 'Profile','1.0.3'
  target 'AppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AppUITests' do
    # Pods for testing
  end
end

target 'Detail' do
project './Feature/Detail/Detail'

end

target 'Core' do
project './Core/Core'

end

target 'Home' do
project './Feature/Home/Home'

end

target 'Favorite' do
project './Feature/Favorite/Favorite'

end
