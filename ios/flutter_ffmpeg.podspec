Pod::Spec.new do |s|
  s.name             = 'flutter_ffmpeg'
  s.version          = '0.4.2'
  s.summary          = 'FFmpeg plugin for Flutter.'
  s.description      = 'FFmpeg plugin based on mobile-ffmpeg for Flutter.'
  s.homepage         = 'https://github.com/tongli-dev/flutter-ffmpeg'

  s.author           = { 'Tong Li' => 'you@example.com' }
  s.license          = { :file => '../LICENSE' }

  s.requires_arc     = true
  s.static_framework = true

  s.source              = { :path => '.' }
  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.default_subspec   = 'https'
  s.dependency          'Flutter'

  s.subspec 'https' do |ss|
    ss.source_files        = 'Classes/**/*'
    ss.public_header_files = 'Classes/**/*.h'
    ss.ios.deployment_target = '11.0'

    ss.dependency 'mobile-ffmpeg-https', :git => 'https://github.com/tongli-dev/mobile-ffmpeg.git', :tag => 'v4.4.LTS'
  end
end
