class Row < Element
  options :width

  def initialize(title)
    super({
      :title => title,
      :showTitle => true,
      :collapse => false,
      :editable => true,
      :height => "250px",
      :panels => []
    })
  end

  def graph(title, &block)
    graph = Graph.new(title)
    graph.instance_eval(&block)

    add_panel(graph)
  end

  def add_panel(panel)
    @hash[:panels] = (@hash[:panels] || []) << panel.to_hash
  end
end
