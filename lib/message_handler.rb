class MessageHandler

  # Handle the provided message
  def handle(message, case_sensitive = true)
    raise TypeError, "wrong argument type #{message.class.name} for message (expected Message)" unless message.is_a?(Message)
    raise TypeError, "wrong argument type #{case_sensitive.class.name} for case_sensitive (expected Boolean)" unless case_sensitive == true or case_sensitive == false
    
    action_sym = message.action.to_sym

    # If case sensitive, attempt to get the method
    if case_sensitive
      return nil unless message.is_valid? and self.respond_to?(action_sym) and __method__ != action_sym

      # Call the method with arguments
      method = self.method(action_sym)
    else
      # Iterate all methods and select the appropriate method
      method = self.methods.select do |method|
        if method.downcase == action_sym.downcase
          break method
        end
      end
    end

    return nil unless method.is_a?(Method)

    # Call the method
    method.call(message)
  end
end
