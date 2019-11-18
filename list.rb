require_relative 'item.rb'

class List
    attr_accessor :label 

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            true
        else
            false
        end
    end

    def toggle_item(idx)
        if self.valid_index?(idx)
            @items[idx].toggle
        end
    end

    def remove_item(idx)
        if self.valid_index?(idx)
            @items.delete_at(idx)
            true
        else
            false
        end
    end

    def purge
        @items.select! { |item| !item.done }
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        idx >= 0 && idx < @items.length
    end

    def swap(idx_1, idx_2)
        if self.valid_index?(idx_1) && self.valid_index?(idx_2)
            @items[idx_1], @items[idx_2] = @items[idx_2], @items[idx_1]
            true
        else
            false
        end
    end

    def [](idx)
        if self.valid_index?(idx)
            @items[idx]
        else
            nil
        end
    end

    def priority
        @items[0]
    end
    def print
        debugger unless @label.length
        puts "-------------------------------------------------\n"\
        "#{"".rjust(26-@label.length)}#{@label.upcase}#{"".ljust(26-@label.length)}\n"\
        "-------------------------------------------------\n"\
        "Index | Item                 | Deadline   | Done  \n"\
        "-------------------------------------------------\n"
        @items.each_with_index { |item, idx|
            puts "#{idx}     | #{item.title.ljust(21)}| #{item.deadline} | #{item.done ? "done!" : ""} \n"
        }
        puts "-------------------------------------------------\n"
    end

    def print_full_item(idx)
        if self.valid_index?(idx)
            puts "------------------------------------------\n"
            puts "#{@items[idx].title}" +  (@items[idx].done ? " "*6 + "*This is done!*" + " "*6 : " "*(32-@items[idx].title.length)) + "#{@items[idx].deadline}"
            puts @items[idx].description + "\n" if @items[idx].description != "" && @items[idx].description != nil
            puts "------------------------------------------\n"
        end
    end

    def print_priority
        print_full_item(0)
    end

    def up(idx, amount=1)
        if self.valid_index?(idx)
            if idx == 0 
                false
            else
                self.swap(idx, (idx-amount < 0 ? 0 : idx-amount))
                true
            end
        else
            false
        end
    end

    def down(idx, amount=1)
        if self.valid_index?(idx)
            if idx == (@items.length - 1)
                false
            else
                self.swap(idx, (idx+amount > @items.length - 1 ? @items.length - 1 : idx+amount))
                true
            end
        else
            false
        end
    end

    def sort_by_date!
        @items.sort! { |a, b| a.deadline <=> b.deadline }
    end
end