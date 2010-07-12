#system 'firefox -jssh &'
system 'ruby script/server -p 3001 -e test -d'
system 'sleep 2'
at_exit do
  system "kill `ps aux | grep -e '-p 3001' | grep -v grep | awk '{ print $2 }'`"
end

require 'firewatir'
browser = FireWatir::Firefox.new

假設 /^用戶來到首頁$/ do
  browser.goto('http://localhost:3001')
end

當 /^用戶在"發件人姓名"欄位中輸入"([^\"]*)"$/ do |value|
  browser.text_field(:name, /sender_name/).set(value)
end

當 /^用戶在"發件人電郵地址"欄位中輸入"([^\"]*)"$/ do |value|
  browser.text_field(:name, /sender_email/).set(value)
end

當 /^用戶在"收件人姓名"欄位中輸入"([^\"]*)"$/ do |value|
  browser.text_field(:name, /recipient_name/).set(value)
end

當 /^用戶在"收件人電郵地址"欄位中輸入"([^\"]*)"$/ do |value|
  browser.text_field(:name, /recipient_email/).set(value)
end

當 /^用戶在"標題"欄位中輸入"([^\"]*)"$/ do |value|
  browser.text_field(:name, /subject/).set(value)
end

當 /^用戶在"內容"欄位中輸入"([^\"]*)"$/ do |value|
  browser.text_field(:name, /message/).set(value)
end

當 /^用戶按下了"發出電子郵件"按钮$/ do
  browser.button(:id, /contactForm_submit/).click
end

那麼 /^用戶應該看到"([^\"]*)"的提示信息$/ do |text|
  browser.text.should include(text)
end

at_exit do
  browser.close
end

