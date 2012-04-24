module Privy
  class PrivyEngine < Rails::Engine
    initializer 'privy_engine.load_controllers' do
      ActiveSupport.on_load :action_controller do
        include Privy::PrivyApplicationController
      end
    end
  end
end