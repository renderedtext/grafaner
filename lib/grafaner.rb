require_relative "grafaner/context"
require_relative "grafaner/element"
require_relative "grafaner/api"

require "json"

def error(message)
  puts message
  exit(1)
end

def update(path)
  error("Template '#{path}' not found") unless File.exists?(path)

  result = schema { load(path) }

  error("Dashboard has no title") unless result[:dashboard][:title]

  pp result

  Api::Dashboard.create(result.to_json)
end
