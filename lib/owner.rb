
class Owner
  attr_reader :name, :species

  @@all = []
  def initialize(name)
    @@all << self
    @name = name
    @species = "human"
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    @@all.count
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each{|dog| 
      if dog.owner == self
        dog.mood = "happy"
      end
     }
    end
    
    def feed_cats
      Cat.all.each{|cat| 
        if cat.owner == self
          cat.mood = "happy"
        end
      }
    end
    
  def sell_pets
    Dog.all.each{|dog| 
      if dog.owner == self
        dog.mood = "nervous"
        dog.owner = nil
      end
    } 
    Cat.all.each{|cat|
      if cat.owner == self
        cat.mood = "nervous"
        cat.owner = nil
      end
    }
  end

  def list_pets
    dog_count = Dog.all.select{|dog| dog.owner == self}.count
    cat_count = Cat.all.select{|cat| cat.owner == self}.count
    "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
  end
end