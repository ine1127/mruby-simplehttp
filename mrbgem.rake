require "#{MRUBY_ROOT}/lib/mruby/source"

MRuby::Gem::Specification.new('mruby-simplehttp') do |spec|
  spec.license = 'MIT'
  spec.authors = 'MATSUMOTO Ryosuke'
  spec.version = '0.0.1'
  spec.add_dependency('mruby-env')
  spec.add_test_dependency('mruby-sprintf', core: 'mruby-sprintf')
  if !ENV['NO_SSL']
    spec.add_dependency('mruby-polarssl')
  end
  spec.add_test_dependency('mruby-simplehttpserver')
  spec.add_test_dependency('mruby-sleep')
  spec.add_test_dependency('mruby-json')

  # need mruby-socket or mruby-uv
  if MRuby::Source::MRUBY_VERSION >= '1.4.0'
    spec.add_dependency('mruby-io', core: 'mruby-io')
    spec.add_dependency('mruby-socket', core: 'mruby-socket')
  else
    spec.add_dependency('mruby-io')
    spec.add_dependency('mruby-socket')
  end
end
