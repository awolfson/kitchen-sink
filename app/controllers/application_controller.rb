class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  skip_before_action :verify_authenticity_token

  before_action :set_locale

  protected

  def set_locale
    locales = I18n.available_locales
    I18n.locale = http_accept_language.compatible_language_from(locales) || I18n.default_locale
  end
end
