# what do I want my object model to look like

class Sport
    attr_accessor :name, :description, :locale, :weather
    @@all = []

    def initialize(name, description, locale, weather)
        @name = name
        @description = description
        @locale = locale
        @weather = weather
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

end