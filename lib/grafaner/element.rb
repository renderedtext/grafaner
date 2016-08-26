class Element
  def self.options(*names)
    names.each do |name|
      define_method(name) do |value|
        raw_options(name => value)
      end
    end
  end

  # def self.subelements(*names)
  #   names.each do |name|
  #     define_method(name) do |&block|
  #       klass_name = name.to_s.split("_").map(&:capitalize).join
  #       element = Kernel.const_get(klass_name).new
  #       element.instance_eval(&block)

  #       raw_options(name => element.to_hash)
  #     end
  #   end
  # end

  def initialize(hash = {})
    @hash = hash
  end

  def to_hash
    @hash
  end

  def raw_options(hash)
    @hash = @hash.merge(hash)
  end
end

