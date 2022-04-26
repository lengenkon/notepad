class Memo < Post

  def read_from_console
    # Метод, который спрашивает у пользователя, что он хочет написать в дневнике
    puts "Я сохраню всё, что ты напишешь до строчки \"end\" в файл."

    # Объявим переменную, которая будет содержать текущую введенную строку
    line = nil
    # Запустим цикл, пока не дошли до строчки "end",
    while line != "end" do
      # Читаем очередную строку и записываем в массив @text
      line = STDIN.gets.chomp
      @text << line
    end

    # Теперь удалим последний элемент из массива @text – там служебное слово "end"
    @text.pop
  end

  def save
    file = File.new(file_path, "w:UTF-8")
    time_string = @created_at.strftime("%Y.%m.%d, %H:%M")
    file.puts(time_string + "\n\r")

    for item in @text do
      file.puts(item)
    end

    file.close
    puts "Ваша запись сохранена"
  end
end