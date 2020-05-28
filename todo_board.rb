require_relative "list"
require_relative "item"
# require "byebug"

class TodoBoard
    def initialize
        @lists = {}
    end

    def run 
        while get_command == true
            get_command
        end
    end

    def get_command
        print "\nEnter a command: "
        cmd, label, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @lists[label] = List.new(label)
            return true
        when "ls"
            @lists.keys.each do |label|
                puts label
            end
            return true
        when "showall"
            @lists.values.each do |list|
                list.print
            end
            return true
        when 'mktodo'
            @lists[label].add_item(*args)
            return true
        when 'up'
            @lists[label].up(*args.map(&:to_i))
            return true
        when 'down'
            @lists[label].down(*args.map(&:to_i))
            return true
        when 'swap'
            @lists[label].swap(*args.map(&:to_i))
            return true
        when 'sort'
            @lists[label].sort_by_date!
            return true
        when 'priority'
            @lists[label].priority
            return true
        when "print"
            if args.empty?
                @lists[label].print
            else
                @lists[label].print_full_item(*args.map(&:to_i))
            end
            return true
        when "toggle"
            @lists[label].toggle_item(*args.map(&:to_i))
            return true 
        when "rm"
            @lists[label].remove_item(*args.map(&:to_i))
            return true
        when "purge"
            @lists[label].purge
            return true
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

end

play = TodoBoard.new
