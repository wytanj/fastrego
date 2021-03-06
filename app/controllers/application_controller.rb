class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_current_subdomain

  def current_registration
    reg = current_user.managed_registrations.for_tournament(current_subdomain, current_user)
    reg.first.nil? ? Registration.new : reg.first
  end
  helper_method :current_registration

  def set_current_subdomain
    Thread.current[:current_subdomain] = request.subdomain 
  end

  def current_subdomain
    Thread.current[:current_subdomain]
  end
  helper_method :current_subdomain

  def current_tournament
    Tournament.find_by_identifier(current_subdomain)
  end
  helper_method :current_tournament

end
