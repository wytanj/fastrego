class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @registration = current_user.registration.nil? ? Registration.new : current_user.registration
    @payment = Payment.new
  end

  def registration
    @registration = Registration.new(params[:registration])
    @registration.user = current_user
    @registration.requested_at = Time.now

    if @registration.save
      redirect_to profile_url, notice: 'Registration was successful.'
    else
      render action: 'show'
    end
  end

  def payments
    @payment = Payment.new(params[:payment])
    @payment.registration = current_user.registration
    if @payment.save
      redirect_to profile_url, notice: 'Payment was successfully recorded.'
    else
      render action: 'show'
    end
  end
end
