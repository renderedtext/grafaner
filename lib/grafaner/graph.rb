class Graph < Panel

  def initialize(title, options = {})
    super(title, options.merge({
      :type => "graph"
    }))
  end

end
