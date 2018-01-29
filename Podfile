platform :ios, '10.0'
use_frameworks!

target 'UberSSOTest' do
	pod 'UberRides'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'UberCore' || target.name == 'UberRides'
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
        end
    end
end
