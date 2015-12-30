Pod::Spec.new do |s|
  s.name             = "Then"
  s.version          = "0.1.1"
  s.summary          = "Super sweet syntactic sugar for Swift initializers."
  s.homepage         = "https://github.com/devxoul/Then"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Suyeol Jeon" => "devxoul@gmail.com" }
  s.source           = { :git => "https://github.com/devxoul/Then.git",
                         :tag => s.version.to_s }
  s.source_files     = "Then/*.swift"
  s.requires_arc     = true

  s.ios.deployment_target = "8.0"
end
