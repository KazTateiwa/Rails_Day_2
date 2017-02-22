class MainController < ApplicationController

  def check
    # Store the user ID and password in instance variables
    @user_id = params[:user_id]
    @password = params[:password]
    # @cred = " "
    # Do some checks for whether they are valid; if they are, return with the String Credentials are acceptable, otherwise use the String Try again.
    if (@user_id.to_s.length >= 6 && @user_id =~ /\d/ && @user_id != @password &&
      @password.to_s.length >= 6 && @password =~ /\d/)
      # @cred = "Valid"
      flash.now[:notice] = "Valid"
    # else
    #   flash.now[:alert] = "Invalid"
    end

    if @user_id.to_s.length < 6
      flash.now[:alert] = "Invalid"
      flash.now[:idlength] = "Your User ID must have at least six characters"
    end

    if !(@user_id =~ /\d/)
      flash.now[:alert] = "Invalid"
      flash.now[:idnum] ="Your User ID must include at least one number"
    end

    if @user_id == @password
      flash.now[:alert] = "Invalid"
      flash.now[:same] ="Your User ID and Password cannot be the same"
    end

    if @password.to_s.length < 6
      flash.now[:alert] = "Invalid"
      flash.now[:passlength] ="Your password must be at least 6 characters"
    end

    if !(@password =~ /\d/)
      flash.now[:alert] = "Invalid"
      flash.now[:passnum] ="Your password must include at least one number"
    end
  end
end
