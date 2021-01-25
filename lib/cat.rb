class Cat
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []
  def initialize(name, owner)
    @@all << self
    @mood = "nervous"
    @name = name
    @owner = owner
  end

  def self.all
    @@all
  end

end