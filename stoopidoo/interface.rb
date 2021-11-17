require 'linenoise'

def command(s)
  command = %w[clear exit date oras].detect { |w| w.match(s.downcase) }
  case command
  when 'clear', 'date', 'oras'
    s	= 'date' if command == 'oras'
    system(s)
  when 'exit'
    send(command)
  end
  s
end

def typewrite(s, t = 0.06)
  s.rjust(10).chars.each do |c|
    sleep(t)
    print c
  end
  print ' '
  s
end

def start_conversation(greet = 'hey, hey! wanna chat?')
	@user = "hooman"
  command('clear')
  typewrite "#{greet}\n"
  typewrite "#{answer_keyword('sino')}\n"
  typewrite "Ano naman name mo?\n"
  @user = input '>> '
  typewrite "Nice to meet you, #{@user.capitalize}!"
  typewrite 'Mabuhay! Darna!'
end


def run
  start_conversation

  loop do
    @found = false

    puts
    typewrite('-' * 120, 0)
    puts
    sentence = input('>> ')
    p post(sentence)
    # record(sentence, reply)
  end
end

