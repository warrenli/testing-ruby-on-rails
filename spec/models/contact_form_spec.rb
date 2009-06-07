require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContactForm do
  before(:each) do
    @valid_attributes = {
      :sender_name      => "陳大文",
      :sender_email     => "abc@example.com",
      :recipient_name   => "李小明",
      :recipient_email  => "xyz@example.com",
      :subject          => "你好嗎",
      :message          => "好久不見，你好嗎?"
    }
    @invalid_attributes = {
      :sender_name      => "陳大文",
      :sender_email     => "abc@example",
      :recipient_name   => "李小明",
      :recipient_email  => "xyz@example.com",
      :subject          => "你好嗎",
      :message          => "好久不見，你好嗎?"
    }
  end

  it "should create a new instance given valid attributes" do
    contact_form = ContactForm.new
    contact_form.update_attributes(@valid_attributes)
    contact_form.sender_name.should == @valid_attributes[:sender_name]
    contact_form.sender_email.should == @valid_attributes[:sender_email]
    contact_form.recipient_name.should == @valid_attributes[:recipient_name]
    contact_form.recipient_email.should == @valid_attributes[:recipient_email]
    contact_form.subject.should == @valid_attributes[:subject]
    contact_form.message.should == @valid_attributes[:message]

    contact_form.to_s.should=~ /#{@valid_attributes[:sender_name]}/
    contact_form.to_s.should=~ /#{@valid_attributes[:sender_email]}/
    contact_form.to_s.should=~ /#{@valid_attributes[:recipient_name]}/
    contact_form.to_s.should=~ /#{@valid_attributes[:recipient_email]}/
    contact_form.to_s.should=~ /#{@valid_attributes[:subject]}/
    contact_form.to_s.should=~ /#{@valid_attributes[:message]}/

    contact_form.save.should be_true
  end

  it "should create a invalid instance given invalid attributes" do
    contact_form = ContactForm.new
    contact_form.update_attributes(@invalid_attributes)
    contact_form.save.should be_false
  end

end
