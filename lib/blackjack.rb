def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(total)
  puts "Your cards add up to #{total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(total)
  puts "Sorry, you hit #{total}. Thanks for playing!"
end

def initial_round
  sum = deal_card + deal_card
  display_card_total(sum)
  sum
end

def hit?(total)
  prompt_user
  input = get_user_input
  until input == 's' || input == 'h'
    invalid_command
    prompt_user
    input = get_user_input
  end
  if input == 'h'
   total += deal_card
  end
  total
end

def invalid_command
  puts "Please enter a valid command"
end

def runner
  system "clear"
  welcome
  total = initial_round
  until total >= 21
    temp = hit?(total)
    if temp == total
      break
    end
    total = temp
    system "clear"
    sleep 0.2
    display_card_total(total)
  end
  if total > 21
    end_game(total)
  end
end
