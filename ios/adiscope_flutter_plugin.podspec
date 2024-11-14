#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint adiscope_flutter_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'adiscope_flutter_plugin'
  s.version          = '3.10.0'
  s.summary          = 'We provide a plugin so that you can integrate adiscope while developing with Flutter.'
  s.description      = <<-DESC
Adiscope SDK for Flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/adiscope/Adiscope-Flutter-Plugin'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Adiscope' => 'adiscope.ad@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  s.dependency 'Adiscope', '3.10.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
