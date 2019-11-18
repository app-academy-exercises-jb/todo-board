require_relative 'list.rb'

class Todo_Board
    def initialize(label)
        @lists = Hash.new { |h, k| h[k] = List.new(k) }
        @quit = false
    end

    def get_command
        print ">"
        input = gets.chomp
        
        case input
        when /^mklist/
            /^mklist (?<label>\w*)$/ =~ input
            @lists[label]
        when /^ls$/
            @lists.keys.each { |list| puts list }
        when /^showall$/
            @lists.each { |k, v| v.print }
        when /^mktodo/
            /^mktodo (?<list>\w*) (?<title>\w*) (?<deadline>\d{4}-\d{2}-\d{2}) ?(?<description>[\w\W]*)$/ =~ input
            @lists[list].add_item(title, deadline, description) if @lists.keys.include?(list)
        when /^toggle/
            /^toggle (?<list>\w*) (?<index>\d*)$/ =~ input
            @lists[list].toggle_item(index.to_i) if @lists.keys.include?(list)
        when /^rm/
            /^rm (?<list>\w*) (?<index>\d*)$/ =~ input
            @lists[list].remove_item(index.to_i) if @lists.keys.include?(list)
        when /^purge/
            /^purge (?<list>\w*)$/ =~ input
            @lists[list].purge if @lists.keys.include?(list)
        when /^up/
            /^up (?<list>\w*) (?<index>\d*) ?(?<amount>\d*)$/ =~ input
            @lists[list].up(index.to_i, amount=="" ? 1 : amount.to_i) if @lists.keys.include?(list)
        when /^down/
            /^down (?<list>\w*) (?<index>\d*) ?(?<amount>\d*)$/ =~ input
            @lists[list].down(index.to_i, amount=="" ? 1 : amount.to_i) if @lists.keys.include?(list)
        when /^swap/
            /^swap (?<list>\w*) (?<index_1>\d*) (?<index_2>\d*)$/ =~ input
            @lists[list].swap(index_1.to_i, index_2.to_i) if @lists.keys.include?(list)
        when /^sort$/
            /^sort (?<list>\w*)$/ =~ input
            @lists[list].sort_by_date! if @lists.keys.include?(list)
        when /^priority$/
            /^priority (?<list>\w*)$/ =~ input
            @lists[list].print_priority if @lists.keys.include?(list)
        when /^print/
            /^print (?<list>\w*) ?(?<index>\d*)$/ =~ input
            (index == "" ? @lists[list].print : @lists[list].print_full_item(index.to_i)) if @lists.keys.include?(list)
        when /^quit$/
            @quit = true
        else
            p input + ": command not found..."
        end
    end

    def run
        get_command until @quit
        @quit = false
    end
end

board = Todo_Board.new('Todo Board')
board.run

