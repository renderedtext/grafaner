require_relative "grafaner/element"
require_relative "grafaner/dashboard"
require_relative "grafaner/row"
require_relative "grafaner/panel"
require_relative "grafaner/graph"

require "json"

def error(message)
  puts message
  exit(1)
end

def update(path)
  error("Template '#{path}' not found") unless File.exists?(path)

  template = File.read(path)

  dashboard = Dashboard.new
  dashboard.instance_eval(template)

  result = {
    :dashboard => dashboard.to_hash,
    :overwrite => true
  }

  error("Dashboard has no title") unless result[:dashboard][:title]

  pp result

  create_dashboard(result.to_json)
end

def create_dashboard(json_template)
  token  = File.read("#{Dir.home}/.grafaner/auth_token").strip
  server = File.read("#{Dir.home}/.grafaner/server").strip

  File.write("/tmp/grafana-template", json_template)

  headers = [
    "-H \"Content-Type: application/json\"",
    "-H \"Authorization: Bearer #{token}\""
  ].join(" ")

  `curl -s #{headers} -X POST --data @/tmp/grafana-template #{server}/api/dashboards/db`
end
