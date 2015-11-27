Pod::Spec.new do |s|
  s.name             = "FormManager"
  s.version          = "0.0.4"
  s.summary          = "A library to create UITableView forms"
  s.description      = <<-DESC
The library helps im building UITableView forms using a MVC pattern
                       DESC

  s.homepage         = "https://github.com/code-surf/FormManager"
  s.license          = 'MIT'
  s.author           = { "Jakub Długosz" => "dlugosz.jakub@gmail.com" }
  s.source           = { :git => "https://github.com/code-surf/FormManager.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'FormManager' => ['Pod/Assets/*.png']
  }
end
