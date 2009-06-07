require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContactController do

  #Delete these examples and add some real ones
  it "should use ContactController" do
    controller.should be_an_instance_of(ContactController)
  end

  describe "GET 'index'" do
    it "should be render template 'index'" do
      ContactForm.should_receive(:new)
      get 'index'
      flash[:notice].should be_nil
      response.should be_success
      response.should render_template('index')
    end
  end

  describe "POST 'index'" do
    before(:each) do
      @params = {
              :sender_name      => "陳大文",
              :sender_email     => "abc@example.com",
              :recipient_name   => "李小明",
              :recipient_email  => "xyz@example.com",
              :subject          => "你好嗎",
              :message          => "好久不見，你好嗎?"
        }
    end

    it "should deliver an email" do
      SimpleMailer.should_receive(:deliver_message)
      post :index, :contactForm => @params
      flash[:notice].should == I18n.t('contact_form.index.success_msg')
      response.should be_success
      response.should render_template('index')
    end

  end

end
