require_relative 'post.rb'
require_relative 'memo.rb'
require_relative 'link.rb'
require_relative 'task.rb'

puts "Привет, я твой блокнот!"
puts "Что хочешь записать в блокнот?"

choices = Post.post_types
choice = -1

until choice >= 0 && choice < choices.size # пока юзер не выбрал правильно
  # выводим заново массив возможных типов поста
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end
  choice = gets.chomp.to_i
end

entry = Post.create(choice)
entry.read_from_console

entry.save

puts "Ваша запись сохранена!"