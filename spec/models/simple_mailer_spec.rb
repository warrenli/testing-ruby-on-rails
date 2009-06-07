require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SimpleMailer do
  before(:all) do
    @valid_attributes = {
      :sender_name      => "陳大文",
      :sender_email     => "abc@example.com",
      :recipient_name   => "李小明",
      :recipient_email  => "xyz@example.com",
      :subject          => "你好嗎",
      :message          => "好久不見，你好嗎?"
    }
    contact_form = ContactForm.new
    contact_form.update_attributes(@valid_attributes)
    @email = SimpleMailer.create_message(contact_form)
  end

  subject { @email }

  it { should deliver_to("#{@valid_attributes[:recipient_email]}") }
  it { should have_body_text(/#{@valid_attributes[:message]}/) }
  it { should have_subject(/#{@valid_attributes[:subject]}/) }

end
