Pod::Spec.new do |s|
s.name         = "XWTagView"
s.version      = "1.0.2"
s.summary      = "XWTagView"
s.description  = "awesome! XWTagView"
s.homepage     = "https://github.com/jprothwell/XWTagView"
s.license      = "MIT"
s.author       = "Leon"
s.source       = { :git => "https://github.com/jprothwell/XWTagView.git", :tag => s.version }
s.source_files = "XWTagView/XWTagView/XWTagView/*.{h,m}"
s.ios.deployment_target = "9.0"

s.dependency 'YYText'
end


