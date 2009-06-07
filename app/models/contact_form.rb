class ContactForm < ActiveRecord::Base
  def self.columns() @columns ||= []; end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  def save(validate = true)
     validate ? valid? : true
  end

  column :sender_name,      :string
  column :sender_email,     :string
  column :recipient_name,   :string
  column :recipient_email,  :string
  column :subject,          :string
  column :message,          :string

  attr_accessor :sender_name, :sender_email, :recipient_name, :recipient_email, :subject, :message

  validates_presence_of :sender_name, :sender_email, :recipient_name, :recipient_email, :subject, :message
  validates_format_of :sender_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :recipient_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

#  def initialize(params)
#    @sender_name     = params["sender_name"]
#    @sender_email    = params["sender_email"]
#    @recipient_name  = params["recipient_name"]
#    @recipient_email = params["recipient_email"]
#    @subject         = params["subject"]
#    @message         = params["message"]
#  end

  def update_attributes(params)
    @sender_name     = params[:sender_name]
    @sender_email    = params[:sender_email]
    @recipient_name  = params[:recipient_name]
    @recipient_email = params[:recipient_email]
    @subject         = params[:subject]
    @message         = params[:message]
    self
  end

  def to_s
    "sender_name: "     + @sender_name      + " " +
    "sender_email: "    + @sender_email     + " " +
    "recipient_name: "  + @recipient_name   + " " +
    "recipient_email: " + @recipient_email  + " " +
    "subject: "         + @subject          + " " +
    "message: "         + @message
  end
end

=begin

*** Test it using IRB ***

n = ContactForm.new

form = { :sender_name => "Warren", :sender_email => "abc@example.com",
:recipient_name => "Peter", :recipient_email => "xyz@example.com",
:subject => "Hello", :message => "Say Hi!" }

n.update_attributes(form)

SimpleMailer.deliver_message(n)

=end
