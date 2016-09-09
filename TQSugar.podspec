Pod::Spec.new do |s|
s.name = "TQSugar"
s.version = "1.1.0"
s.summary      = "Taqtile Sugar lib"

s.homepage     = "https://github.com/indigotech/sugar"
s.license = { :type => 'Comercial'}
s.author  = { "Taqtile" => "rafael.ring@taqtile.com" }
s.source       = { :git => "https://github.com/indigotech/sugar", :tag => "1.1.0" }

s.platform = :ios, '8.0'
s.requires_arc = true
s.source_files = 'TQSugar/*.h'
s.vendored_library = 'TQSugar/libTQSugar.a'

s.library = 'TQSugar'
s.dependency 'TQSwift', '~> 1.1.0'
s.dependency 'TQToffee', '~> 1.1.0'
s.libraries       = 'xml2'
end
