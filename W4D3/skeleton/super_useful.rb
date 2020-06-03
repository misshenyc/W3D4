# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class NotFruitError < StandardError 
  def message
    puts "give me a fruit i like please"
  end
end

class CoffeeSecondTry < StandardError 
  def message
    puts "well i like coffee so you get second chance"
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeSecondTry
  else
    raise NotFruitError
  end 
  
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)

    sam = BestFriend.new('name', 6, 'do stuff')
    sam.talk_about_friendship
    sam.do_friendstuff
    sam.give_friendship_bracelet
    
  rescue CoffeeSecondTry => e
    puts e.message
    retry
  rescue NotFruitError => e
    puts e.message
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @fav_pastime = fav_pastime
    raise "Who are you? and what do you want to do, friend?" if @name.length <= 0 && @fav_pastime.length <= 0
    @yrs_known = yrs_known
    raise "I do not know you well enough yet, friend." if @yrs_known < 5
    # raise StandardError.new("you must have a name") if @name.length <= 0
    # raise StandardError.new("i don't know you well enough yet") if @yrs_known < 5
    # raise StandardError.new("what do you want to do?") if @fav_pastime.length <= 0
   end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


