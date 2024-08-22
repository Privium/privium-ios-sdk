Pod::Spec.new do |s|
  s.name             = 'PriviumSDK'
  s.version          = '1.0.0'
  s.summary          = 'A privacy-preserving analytics and federated learning SDK for iOS.'

  s.description      = <<-DESC
    PriviumSDK is designed to help developers and companies implement privacy-preserving analytics,
    federated learning, and real-time edge computing into their iOS applications.
    DESC

  s.homepage         = 'https://github.com/Privium/privium-ios-sdk' # Ensure this is correct or remove if not available
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ryan Napolitano' => 'ryannapp@gmail.com.com' }
  s.source           = { :git => 'https://github.com/Privium/privium-ios-sdk.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'

  s.source_files     = 'Sources/**/*.{swift,h,m}'
  s.exclude_files    = 'Sources/Exclude'

  s.requires_arc     = true

  s.frameworks       = 'Foundation', 'CoreML', 'CryptoKit'

  s.swift_version    = '5.0'

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{swift,h,m}' # Updated to reflect the new Tests directory
    test_spec.requires_arc = true
    test_spec.frameworks = 'XCTest'
  end
end
