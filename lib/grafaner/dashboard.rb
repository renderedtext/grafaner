class Dashboard < Element
  options :title

  def row(title, &block)
    row = Row.new(title)
    row.instance_eval(&block)
    add_row(row)
  end

  def add_row(row)
    @hash[:rows] = (@hash[:rows] || []) << row.to_hash
  end
end
