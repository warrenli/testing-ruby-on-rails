# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :set_locale

  private

    def set_locale
      # update session if passed
      # session[:locale] = params[:locale] if params[:locale]
      new_locale = (AVAILABLE_LOCALES.include? params[:locale]) ? params[:locale]  : nil
      session[:locale] = new_locale if new_locale

      # set locale based on session or default
      I18n.locale = session[:locale] || I18n.default_locale
      logger.debug "Locale set to '#{I18n.locale}'"

    end

end
