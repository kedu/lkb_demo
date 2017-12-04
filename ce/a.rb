  re ‘rubygems'
  require ‘watir’ # the watir controller
  # open the IE browser
  ie = Watir::IE.new
  # Step 1: go to the test site: http://www.google.com
  ie.goto (http://www.google.com)
  # Step 2: enter ‘pickaxe’ in the search text field
  ie.text_field(:name, “q”).set(”pickaxe”) # q is the name of the search field
  # Step 3: click the ‘Google Search’ button
  ie.button(:name, “btnG”).click # “btnG” is the name of the Search button
  # Actual Result: Check that the ‘Programiming Ruby’ link appears on the results page
  if ie.contains_text(”Ruby”)
  puts “Test Passed. Found the test string: ‘Programming Ruby’. Actual Results match Expected Results.”
  else
  puts “Test Failed! Could not find: ‘Ruby’”
  end
