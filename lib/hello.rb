class Hello
  
  def initialize
    @output_console = $stdout
    @input_console = $stdin
    @name = []
  end
  
  attr_reader :name
  attr_accessor :input_console, :output_console
  
  def prompt_first
    @output_console.puts "What's your first name?"
  end
  
  def prompt_middle
    @output_console.puts "What's your middle initial?"
  end
  
  def prompt_last
    @output_console.puts "What's your last name?"
  end
  
  def prompt_full
    prompt_first
    prompt_read
    prompt_middle
    prompt_read
    prompt_last
    prompt_read
  end
  
  def prompt_read
    @name << @input_console.gets.chomp
  end
  
  def hello
    full = @name.join(" ")
    case full
    when "Brian P O'Rourke"
      @output_console.puts "sup, teach?"
    else
      @output_console.puts "Hi, #{full}!"
    end
  end

end