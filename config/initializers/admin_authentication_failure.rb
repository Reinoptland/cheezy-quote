class AdminAuthicationFailure < Devise::FailureApp
  def redirect_url
    new_user_session_url(:subdomain => 'secure')
  end

  def respond
    if http_auth?
      http_auth
    else
      flash[:alert] = i18n_message unless flash[:notice]
      redirect_to "/"
    end
  end
end
