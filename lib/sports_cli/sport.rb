class Sport

    attr_reader :name, :description
    @@all = []

    def initialize(name, description)
        @name = name
        @description = description
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.reset_all
        self.all.clear
    end

    def self.find_sport_by_name(sport_name)
        self.all.find do |sport|
        sport.name == sport_name
        end
    end
end