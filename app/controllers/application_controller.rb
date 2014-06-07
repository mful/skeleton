class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  class AgileLife::NotFoundError < StandardError; end
  rescue_from AgileLife::NotFoundError, :with => :rescue_not_found

  protected

  # TODO: render 404 page here
  def rescue_not_found
    render nothing: true, status: 404
  end

  # TODO: rethink this
  def authenticate!
    unless signed_in? && current_user.id == params[:id].to_i
      raise AgileLife::NotFoundError
    end
  end

end
