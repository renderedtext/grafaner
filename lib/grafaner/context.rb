class GrafanerContext
  @@current_context = {}

  def self.new_context
    parent_context = @@current_context
    new_context = {}
    @@current_context = new_context

    yield

    @@current_context = parent_context
    new_context
  end

  def self.set(name, value = nil)
    if block_given?
      value = new_context { yield }
    end

    @@current_context[name] = value
    @@current_context
  end

  def self.append(name, value = nil)
    if block_given?
      value = new_context { yield }
    end

    @@current_context[name] ||= []
    @@current_context[name].push(value)
    @@current_context
  end

  def self.get(name)
    @@current_context[name]
  end
end
