Pod::Spec.new do |s|
  s.name             = 'animated_splash_plugin'
  s.version          = '0.0.1'
  s.summary          = 'A plugin to show animated Lottie splash screens.'
  s.homepage         = 'https://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'your_name' => 'your_email@example.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'lottie-ios', '~> 3.4.0' # Add Lottie dependency here
  s.ios.deployment_target = '11.0'
end
