
Pod::Spec.new do |spec|
  spec.name                   = "LHxHub"
  spec.version                = "1.0.2"
  spec.summary                = "A personal framework only use by laohanme"
  spec.description            = "A personal framework that made by laohanme"
  spec.homepage               = "https://github.com/laohanme/LHHub"
  spec.license                = { :type => 'MIT', :file => 'LICENSE' }
  spec.author                 = "laohanme"
  spec.social_media_url       = "https://twitter.com/laohanme"
  spec.platform               = :ios, "12.0"
  spec.ios.deployment_target  = '11.0'
  spec.source                 = { :git => "https://github.com/laohanme/LHHub.git", :tag => "#{spec.version}" }
  spec.source_files           = "LHHub/**/*{h,m,swift}"
  spec.swift_versions         = "5.0"
  spec.frameworks             = 'UIKit', 'Foundation'
end