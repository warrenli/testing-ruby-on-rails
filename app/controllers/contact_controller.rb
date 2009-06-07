class ContactController < ApplicationController

  def index
    @contactForm = ContactForm.new
    if request.post? and params["contactForm"]
      @contactForm.update_attributes(params["contactForm"])
      if @contactForm.valid?
        SimpleMailer.deliver_message(@contactForm)
        flash[:notice] = t('contact_form.index.success_msg')
      else
        flash[:notice] = t('contact_form.index.failed_msg')
      end
    end
  rescue Exception => e
    flash[:notice] = e
  end

end
