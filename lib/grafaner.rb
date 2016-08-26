require_relative "grafaner/element"
require_relative "grafaner/dashboard"
require_relative "grafaner/row"
require_relative "grafaner/panel"

require "json"

def update
  template = File.read("./test.grafaner")

  dashboard = Dashboard.new
  dashboard.instance_eval(template)

  dashboard.to_hash
end
