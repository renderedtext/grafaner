class Dashboard < Element
  options :title, :tags, :style, :timezone, :editable

  def initialize
    super({
      :tags => [],
      :style => "dark",
      :timezone => "browser",
      :editable => true,
      :hideControls => false,
      :sharedCrosshair => false
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
