#!/usr/bin/env ruby

require "mechanize"
require "readline"
require "rainbow"

agent = Mechanize.new
agent.user_agent_alias = "Windows IE 8"

while input = Readline.readline("agent.".color(:yellow), true)
  begin
    case input
    when "new"
      agent = Mechanize.new
    when /^#{URI.regexp}$/
      puts "get: #{input}".color(:cyan)
      agent.get(input)
    when *%w(exit quit bye)
      break
    else
      puts agent.instance_eval(input)
    end
  rescue
    puts $!.to_s.color(:red)
  end
end
