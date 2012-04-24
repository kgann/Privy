module Privy
  module LoginHelper
    def flash_errors(tag='p')
      [flash[:privy_message]].flatten.reduce(String.new) do |html, message|
        html << "<#{tag} class='privy_message'>#{message}</#{tag}>"
      end.html_safe
    end
  end
end