class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_theme

  private

  def set_theme
    ActionController::Base.template_root = File.join(RAILS_ROOT, 'app/views', theme) if theme
  end

  def theme
    session[:theme] = params[:theme] if params[:theme]
    session[:theme]
  end
end
