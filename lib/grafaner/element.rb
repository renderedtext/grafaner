def row(row_title)
  append(:rows) do
    set(:title, row_title)
    set(:showTitle, true)
    set(:collapse, false)
    set(:editable, true)
    set(:height, "250px")
    set(:panels, [])

    yield
  end
end

def panel(panel_title)
  id = (get(:panels) || []).size + 1

  append(:panels) do
    set(:id, id)
    set(:title, panel_title)
    set(:aliasColors, {})
    set(:bars, false)
    set(:datasource, nil)
    set(:decimals, 0)
    set(:editable, true)
    set(:error, false)
    set(:fill, 1)
    set(:span, 3)

    yield
  end
end

def graph(graph_title)
  panel(graph_title) do
    set(:type, "graph")

    yield
  end
end

def dashboard
  set(:dashboard) do
    set(:tags, [])
    set(:style, "dark")
    set(:timezone, "browser")
    set(:editable, true)
    set(:hideControls, false)
    set(:sharedCrosshair, false)
    set(:time, { "from" => "now-6h", "to" => "now" })
    set(:templating, { "list" => [] })
    set(:annotations, { "list" => [] })
    set(:timepicker, {
      "refresh_intervals" => [
        "5s", "10s", "30s", "1m", "5m", "15m", "30m", "1h", "2h", "1d"
      ],
      "time_options": [
        "5m", "15m", "1h", "6h", "12h", "24h", "2d", "7d", "30d"
      ]
    })
    set(:schemaVersion, 6)
    set(:version, 2)

    yield
  end
end

def schema
  set(:overwrite, true)

  dashboard { yield }
end

def metric
  append(:targets) do
    set(:dsType, "influxdb")

    set(:groupBy, [
      { "params": [ "$interval" ], "type": "time" },
      { "params": [ "null" ], "type": "fill" }
    ])

    set(:policy, "default")
    set(:refId, "B")
    set(:resultFormat, "time_series")

    set(:select, [
      [
        { "params": [ "value" ], "type": "field" },
        { "params": [], "type": "max" }
      ]
    ])

    set(:tags, [])

    yield
  end
end
