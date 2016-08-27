class Panel < Element
  @@panel_id = 0

  options :width

  def initialize(title, options = {})
    @@panel_id += 1

    super(options.merge({
      :id => @@panel_id,
      :title => title,
      :aliasColors => {},
      :bars => false,
      :datasource => nil,
      :decimals => 0,
      :editable => true,
      :error => false,
      :fill => 1,
      :span => 3,
      # :grid => {
      #   :"threshold1" => nil,
      #   :"threshold1Color" => "rgba(216, 200, 27, 0.27)",
      #   :"threshold2" => nil,
      #   :"threshold2Color" => "rgba(234, 112, 112, 0.22)",
      #   :"thresholdLine" => false
      # },
      "legend": {
        "alignAsTable" => true,
        "avg" => false,
        "current" => true,
        "hideEmpty" => false,
        "max" => false,
        "min" => false,
        "rightSide" => true,
        "show" => true,
        "total" => false,
        "values" => true
      }
    }))
  end
end
