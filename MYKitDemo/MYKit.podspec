Pod::Spec.new do |s|

  s.name         = "MYKit"
  s.version      = "1.0.0"
  s.summary      = "效率工具类 & 系统文件归类整理；"
  s.description  = <<-DESC
		   效率工具类 & 系统文件归类整理；
                   DESC

  s.homepage     = "https://github.com/sunjinshuai/MYKit"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author       = { "sunjinshuai" => "s_mike@163.com" }
  s.platform     = :ios
  s.source       = { 
	:git => "https://github.com/sunjinshuai/MYKit.git", 
	:tag => "#{s.version}" 
  }

  s.requires_arc = true
  s.platform     = :ios, '8.0'
  s.public_header_files = 'MYKit/MYKit.h'
  s.source_files = 'MYKit/MYKit.h'
  s.frameworks = 'UIKit'

  s.subspec 'UIKit' do |ss|
    ss.source_files = 'MYKit/UIKit/**/*'
    ss.public_header_files = 'MYKit/UIKit/**/*.h'
  end

  s.subspec 'Foundation' do |ss|
    ss.source_files = 'MYKit/Foundation/**/*'
    ss.public_header_files = 'MYKit/Foundation/**/*.h'
  end
end
