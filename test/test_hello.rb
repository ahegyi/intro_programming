require 'hello'

class TestHello < Test::Unit::TestCase
  
  class FakeOutputConsole
    def read
      @data
    end
    def puts (data)
      @data = data
    end
  end
  
  class FakeInputConsole
    def initialize
      @name = []
    end
    def set(name)
      @name = name
    end
    def gets
      @name.shift
    end
  end
  
  
  def setup
    @app = Hello.new
  end
  
  def teardown
    #nothing to do
  end
  
  
  def test_failure
    assert_equal true, true
  end
  
  def test_creation
    assert_equal Hello, @app.class 
  end
  
  def test_get_nil_name
    assert_equal @app.name, []
  end
  

  def test_prompt
#    app.prompt
#    assert_equal "What's your name?", output_console.read
  end
  
  def test_default_console
    assert_equal $stdout, @app.output_console
    assert_equal $stdin, @app.input_console
  end
  
  def test_read_prompt
    @output_console = FakeOutputConsole.new
    @app.output_console = @output_console
    
    @input_console = FakeInputConsole.new
    @app.input_console = @input_console
    
    @input_console.set(["George","P","Stagg"])
    @app.prompt_full
    assert_equal ["George","P","Stagg"], @app.name

    @app.hello
    assert_equal "Hi, George P Stagg!", @output_console.read
  end
  
  def test_special_case
    @output_console = FakeOutputConsole.new
    @app.output_console = @output_console
    
    @input_console = FakeInputConsole.new
    @app.input_console = @input_console
    
    @input_console.set(["Brian","P","O'Rourke"])
    @app.prompt_full
    assert_equal ["Brian", "P", "O'Rourke"], @app.name
    
    @app.hello
    assert_equal "sup, teach?", @output_console.read
  end
  
end