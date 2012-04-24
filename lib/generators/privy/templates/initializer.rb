# Be sure to restart your server when you modify this file.

Privy::PrivyEngine.config.after_initialize do |privy|
  privy.config.mount_point = '/users'
  privy.config.return_to = true

  privy.config.login_success_message = 'Welcome back!'
  privy.config.login_success_return_to = '/'

  privy.config.login_failure_message = 'The password/username combo is not correct.'
  privy.config.login_failure_return_to = '/login'
  privy.config.after_logout_return_to = '/login'
  privy.config.after_logout_message = 'You have been logged out.'
end