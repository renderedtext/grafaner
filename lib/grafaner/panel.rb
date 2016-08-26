class Panel < Element
  options :width

  def initialize(title)
    @hash = { :title => title }
  end
end
