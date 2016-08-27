class Dashboard < Element
  options :title, :tags, :style, :timezone, :editable

  def initialize
    super({
      :tags => [],
      :style => "dark",
      :timezone => "browser",
      :editable => true,
      :hideControls => false,
      :sharedCrosshair => false,
      "time" => {
        "from" => "now-6h", "to" => "now"
      },
      "timepicker" => {
        "refresh_intervals" => [
          "5s", "10s", "30s", "1m", "5m", "15m", "30m", "1h", "2h", "1d"
        ],
        "time_options": [
          "5m", "15m", "1h", "6h", "12h", "24h", "2d", "7d", "30d"
        ]
      },
      "templating" => {
        "list" => []
      },
      "annotations" => {
        "list" => []
      },
      "schemaVersion" => 6,
      "version" => 2
    })
  end

  def row(title, &block)
    row = Row.new(title)
    row.instance_eval(&block)
    add_row(row)
  end

  def add_row(row)
    @hash[:rows] = (@hash[:rows] || []) << row.to_hash
  end
end
