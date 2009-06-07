class SimpleMailer < ActionMailer::Base
  #   default_url_options[:host] = "example.com"

  def message(contact_form)
    #puts contact_form.to_s

    @from         = contact_form.sender_email
    @recipients   = contact_form.recipient_email
    @subject      = contact_form.subject
    @sent_on      = Time.now.utc

    @body         = { "contact_form" => contact_form }
    @bcc          = [contact_form.sender_email, "admin@example.com"]
    @content_type = "text/plain"                 #    @content_type  "text/html"

#    @headers      = { "Reply-to" => contact_form.sender_email }
    @reply_to     = contact_form.sender_email
  end

end

