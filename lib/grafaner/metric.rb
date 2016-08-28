class Metric < Element
  options :measurement
  options :alias_name
  options :tags
  options :dsType

  def initialize(alias_name = nil)
    super({
      "dsType": "influxdb",
      "alias": alias_name,
      "groupBy": [
        { "params": [ "$interval" ], "type": "time" },
        { "params": [ "null" ], "type": "fill" }
      ],
      "policy": "default",
      "refId": "B",
      "resultFormat": "time_series",
      "select": [
        [
          { "params": [ "value" ], "type": "field" },
          { "params": [], "type": "max" }
        ]
      ],
      "tags": []
    })
  end
end
