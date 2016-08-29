module Api
  module Dashboard
    module_function

    def create(json_template)
      token  = File.read("#{Dir.home}/.grafaner/auth_token").strip
      server = File.read("#{Dir.home}/.grafaner/server").strip

      File.write("/tmp/grafana-template", json_template)

      headers = [
        "-H \"Content-Type: application/json\"",
        "-H \"Authorization: Bearer #{token}\""
      ].join(" ")

      data = "--data @/tmp/grafana-template"
      url  = "#{server}/api/dashboards/db"

      `curl -s #{headers} -X POST #{data} #{url}`
    end
  end
end
