class Tweet
  attr_reader :attributes

  def initialize(attributes={})
    @attributes = attributes.with_indifferent_access
  end

  def to_hash
    @attributes
  end
end
