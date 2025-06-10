Pod::Spec.new do |s|
  s.name             = 'flutter_ffmpeg'
  s.version          = '0.4.2'
  s.summary          = 'FFmpeg plugin for Flutter.'
  s.description      = 'FFmpeg plugin based on mobile-ffmpeg for Flutter.'
  s.homepage         = 'https://github.com/tongli-dev/flutter-ffmpeg'

  s.author           = { 'Taner Sener' => 'tanersener@gmail.com' }
  s.license          = { :file => '../LICENSE' }

  s.requires_arc     = true
  s.static_framework = true

  s.source              = { :path => '.' }
  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.default_subspec   = 'https'
  s.dependency          'Flutter'

  # -- Subspecs --
  [
    'min', 'min-lts', 'min-gpl', 'min-gpl-lts',
    'https', 'https-lts', 'https-gpl', 'https-gpl-lts',
    'audio', 'audio-lts',
    'video', 'video-lts',
    'full', 'full-lts', 'full-gpl', 'full-gpl-lts'
  ].each do |variant|
    s.subspec variant do |ss|
      ss.source_files        = 'Classes/**/*'
      ss.public_header_files = 'Classes/**/*.h'
      ss.ios.deployment_target = variant.include?('lts') ? '9.3' : '11.0'

      # Map variant to correct pod name
      ffmpeg_pod = "mobile-ffmpeg-#{variant}"
      ss.dependency ffmpeg_pod, :git => 'https://github.com/tongli-dev/mobile-ffmpeg.git', :branch => 'master'
    end
  end
end
