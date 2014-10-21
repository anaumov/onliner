SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :sign_in, 'Войти', new_user_session_path unless current_user
    primary.item :sign_up, 'Зарегистироваться', new_user_registration_path unless current_user
    primary.item :profile, 'Профиль', profile_path if current_user
    primary.item :sign_out, 'Выйти', destroy_user_session_path, method: :delete if current_user
    #  = link_to 'Выход', destroy_user_session_path, method: :delete

    primary.dom_class = 'nav navbar-nav pull-right'

    # you can turn off auto highlighting for a specific level
    primary.auto_highlight = true
  end
end
