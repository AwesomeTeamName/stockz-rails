require 'message'

class MessageHandler
  # Handle the provided message
  def handle(message)
    raise TypeError, "wrong argument type #{message.class.name} for message (expected Message)" unless message.is_a?(Message)
    return nil unless message.is_valid?

    return nil unless self.respond_to?(message.action)
  end
end
