#!/usr/bin/ruby1.9 -w

require 'redcarpet'
require 'erb'
require 'fileutils'

CONFIG = {
  refresher: 'refresher.md',
  template: 'refresher.erb',
  css: "refresher.css",
  target: "#{ENV['HOME']}/x/www/rubyrefresher"
}

def markdown(text)
  renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                     :autolink => true)
  renderer.render(text)
end

template = ERB.new(File.read(CONFIG[:template]))
the_refresher = markdown(File.read(CONFIG[:refresher]))
html = template.result(binding)

target_html = CONFIG[:target] + "/index.html"
File.open(target_html, 'w') do |f|
  f.puts html
end

FileUtils.cp CONFIG[:css], CONFIG[:target]
