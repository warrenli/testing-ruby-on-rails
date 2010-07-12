假設 /^我來到(.+)$/ do |page_name|
  visit path_to(page_name)
end

當 /^我?在"([^\"]*)"欄位中輸入"([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

當 /^我?按下了"([^\"]*)"按钮$/ do |button|
  click_button(button)
end

那麼 /^我停留在(.+)$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end

那麼 /^我應該看到"([^\"]*)"的提示信息$/ do |text|
  response.should contain(text)
end

那麼 %r{^"([^"]*?)" 應該收到 (\d+) 封電子郵件$} do |address, amount|
  unread_emails_for(address).size.should == parse_email_count(amount)
end

當 %r{^"([^"]*?)" 閱讀標題為 "([^"]*?)" 的電子郵件$} do |address, subject|
  open_email(address, :with_subject => subject)
end

那麼 %r{^在電子郵件裡中應該寫着 "([^"]*?)"$} do |text|
  current_email.body.should =~ Regexp.new(text)
end

