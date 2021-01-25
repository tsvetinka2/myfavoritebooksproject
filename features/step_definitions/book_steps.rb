Given (/the following books exist/) do |books_table|
    books_table.hashes.each do |book|
      # each returned element will be a hash whose key is the table header.
      # we should arrange to add that book to the database here.
      Book.create book
    end
end

When (/^(?:|I )go to (.+)$/) do |page_name|
    visit path_to(page_name)
end


And (/^(?:|I )fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
    fill_in(field, :with => value)
end

And (/^(?:|I )press "([^"]*)"$/) do |button|
    click_button(button)
end

Then(/^the author of "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
    Book.find_by_title(arg1).author == arg2
end

Given (/^(?:|I )am on (.+)$/) do |page_name|
    visit path_to(page_name)
end

When (/^(?:|I )follow "([^"]*)"$/) do |link|
    click_link(link)
end

Then (/^(?:|I )should be on (.+)$/) do |page_name|
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
        current_path.should == path_to(page_name)
    else
        assert_equal path_to(page_name), current_path
    end
end

Then (/^(?:|I )should see "([^"]*)"$/) do |text|
    if page.respond_to? :should
        page.should have_content(text)
    else
        assert page.has_content?(text)
    end
end

Then (/^(?:|I )should not see "([^"]*)"$/) do |text|
    if page.respond_to? :should
        page.should have_no_content(text)
    else
        assert page.has_no_content?(text)
    end
end