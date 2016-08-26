class Row < Element
  options :width

  def initialize(title)
    @hash = { :title => title }
  end

  def panel(title, &block)
    panel = Panel.new(title)
    panel.instance_eval(&block)

    add_panel(panel)
  end

  def add_panel(panel)
    @hash[:panels] = (@hash[:panels] || []) << panel.to_hash
  end
end
