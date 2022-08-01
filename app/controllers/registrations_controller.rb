class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(_resource)
    root_path
  end
end
