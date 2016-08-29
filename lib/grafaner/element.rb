def title(value)
  GrafanerContext.set(:title, value)
end

def row(row_title)
  GrafanerContext.append(:rows) do
    GrafanerContext.set(:title, row_title)
    GrafanerContext.set(:showTitle, true)
    GrafanerContext.set(:collapse, false)
    GrafanerContext.set(:editable, true)
    GrafanerContext.set(:height, "250px")
    GrafanerContext.set(:panels, [])

    yield
  end
end

def panel(panel_title)
  id = (GrafanerContext.get(:panels) || []).size + 1

  GrafanerContext.append(:panels) do
    GrafanerContext.set(:id, id)
    GrafanerContext.set(:title, panel_title)
    GrafanerContext.set(:aliasColors, {})
    GrafanerContext.set(:bars, false)
    GrafanerContext.set(:datasource, nil)
    GrafanerContext.set(:decimals, 0)
    GrafanerContext.set(:editable, true)
    GrafanerContext.set(:error, false)
    GrafanerContext.set(:fill, 1)
    GrafanerContext.set(:span, 3)

    yield
  end
end

def graph(graph_title)
  panel(graph_title) do
    GrafanerContext.set(:type, "graph")

    yield
  end
end

def dashboard
  GrafanerContext.set(:dashboard) do
    GrafanerContext.set(:tags, [])
    GrafanerContext.set(:style, "dark")
    GrafanerContext.set(:timezone, "browser")
    GrafanerContext.set(:editable, true)
    GrafanerContext.set(:hideControls, false)
    GrafanerContext.set(:sharedCrosshair, false)
    GrafanerContext.set(:time, { "from" => "now-6h", "to" => "now" })
    GrafanerContext.set(:templating, { "list" => [] })
    GrafanerContext.set(:annotations, { "list" => [] })
    GrafanerContext.set(:timepicker, {
      "refresh_intervals" => [
        "5s", "10s", "30s", "1m", "5m", "15m", "30m", "1h", "2h", "1d"
      ],
      "time_options": [
        "5m", "15m", "1h", "6h", "12h", "24h", "2d", "7d", "30d"
      ]
    })
    GrafanerContext.set(:schemaVersion, 6)
    GrafanerContext.set(:version, 2)

    yield
  end
end

def schema
  GrafanerContext.set(:overwrite, true)

  dashboard { yield }
end

def metric
  GrafanerContext.append(:targets) do
    GrafanerContext.set(:dsType, "influxdb")

    GrafanerContext.set(:groupBy, [
      { "params": [ "$interval" ], "type": "time" },
      { "params": [ "null" ], "type": "fill" }
    ])

    GrafanerContext.set(:policy, "default")
    GrafanerContext.set(:refId, "B")
    GrafanerContext.set(:resultFormat, "time_series")

    GrafanerContext.set(:select, [
      [
        { "params": [ "value" ], "type": "field" },
        { "params": [], "type": "max" }
      ]
    ])

    GrafanerContext.set(:tags, [])

    yield
  end
end

def measurement(value)
  GrafanerContext.set(:measurement, value)
end
