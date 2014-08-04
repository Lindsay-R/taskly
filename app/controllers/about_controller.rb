class AboutController < ApplicationController
  skip_before_action :ensure_current_user  #says: skip user login because this is an anonymous user

  def about

  end
end