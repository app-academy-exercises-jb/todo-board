class Item
    attr_accessor :title, :description
    attr_reader :deadline, :done

    def initialize(title, deadline, description)
        @title, @deadline, @description, @done = title, deadline, description, false
    end

    def self.valid_date?(date)
        /\d{4}-\d{2}-\d{2}/.match?(date)
    end

    def toggle
        @done = !@done
    end

    def deadline=(date)
        unless Item.valid_date?(date)
            raise "invalid date"
        else
            @deadline = date
        end
    end
end