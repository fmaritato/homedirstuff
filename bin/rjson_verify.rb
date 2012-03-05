#!/usr/bin/env ruby
require 'rubygems'
require 'json'

buf = ""
unless STDIN.tty?  # we are in a pipeline
  while((line = STDIN.gets))
    buf = buf + line
  end
else
end

puts "#{buf}\n"
JSON.parse(buf)
