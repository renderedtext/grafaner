class Panel < Element
  options :width

  def initialize(title)
    super({
      :title => title,
      :aliasColors => {},
      :bars => false,
      :datasource => nil,
      :decimals => 0,
      :editable => true,
      :error => false,
      :fill => 1,
      :grid => {
        :"threshold1" => nil,
        :"threshold1Color" => "rgba(216, 200, 27, 0.27)",
        :"threshold2" => nil,
        :"threshold2Color" => "rgba(234, 112, 112, 0.22)",
        :"thresholdLine" => false
      }
    })
  end
end
