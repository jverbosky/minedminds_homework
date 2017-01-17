# Module for methods related to user input, input evaluation and method execution
# Required by main.rb

# Load the Method_Variations module in the same directory
$LOAD_PATH << '.'
require "Method_Variations.rb"

module Method_Select

  # Method to prompt user for method to use
  def Method_Select.user_input()
    puts "\nMethod 1 - If/Else"
    puts "Method 2 - Single Line If/Else"
    puts "Method 3 - Chained Logical Operators"
    puts "Method 4 - Lambdas + Case Statement"
    puts "Method 5 - Custom Modulo"
    puts "Method 6 - List Comprehension"
    puts "Method 7 - Base Conversion"
    print "\nSelect a method number and press Enter:"
    input = gets.chomp
    test_input(input)
  end

  # Method to evaluate user input for multiple or invalid method numbers
  def Method_Select.test_input(selection)
    valid_methods = ["1", "2", "3", "4", "5", "6", "7"]
    compare = selection.split("")
    intersection = valid_methods & compare
    if intersection.size > 1
      puts "\nYour input contained multiple valid method numbers - please try again."
      user_input()
    elsif intersection.empty? == false
      user_selection(intersection.join)
    else
      puts "\nNo valid method number specified - please try again."
      user_input()
    end
  end

  # Method to confirm user input and advise on method being run
  def Method_Select.user_selection(method)
    methods_text = { 
      "1" => "1 - If/Else...",
      "2" => "2 - Single Line If/Else...",
      "3" => "3 - Chained Logical Operators...",
      "4" => "4 - Lambdas + Case Statement...",
      "5" => "5 - Custom Modulo...",
      "6" => "6 - List Comprehension...",
      "7" => "7 - Base Conversion..."
    }
    puts "\nYour input contained '#{method}' - running Method #{methods_text[method]}"
    puts "\n"
    run_method(method)
  end

  # Method to run the selected method
  def Method_Select.run_method(item)
    case item
      when "1" then Method_Variations.if_else()
      when "2" then Method_Variations.one_liner()
      when "3" then Method_Variations.log_ops()
      when "4" then Method_Variations.lambda_case()
      when "5" then Method_Variations.custom_modulo()
      when "6" then Method_Variations.list_comprehension()
      when "7" then Method_Variations.base_conversion()    
    end
  end

end