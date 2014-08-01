require 'message'

class Parser
  # Get the action from the provided message
  # Returns nil if no action is found
  def get_action(message)
    # Validate argument type
    raise TypeError, "wrong argument type #{message.class.name} for message (expected String)" unless message.is_a?(String)

    # Ensure a valid message is provided
    return nil unless message.length > 0

    # Return the first word in the message
    message.split(' ').first
  end

  # Get arguments from the provided message
  # Returns an empty array if no arguments are found
  def get_arguments(message)
    # Validate argument type
    raise TypeError, "wrong argument type #{message.class.name} for message (expected String)" unless message.is_a?(String)

    # Ensure a valid message is provided
    return [] unless message.length > 0

    # Split the message into words
    pieces = message.split(' ')

    # Check whether there are any arguments
    return [] unless pieces.length > 1

    # Remove the action and return the remaining arguments
    pieces.shift
    pieces
  end

  # Parse a message into a Message object
  # Returns nil if an invalid message is provided
  def parse(message)
    # Validate argument type
    raise TypeError, "wrong argument type #{message.class.name} for message (expected String)" unless message.is_a?(String)

    # Ensure a valid message is provided
    return nil unless message.length > 0

    # Split message into components
    action = self.get_action(message)
    arguments = self.get_arguments(message)

    # Validate action
    return nil unless action.is_a?(String) && action.length > 0

    # Create and return Message object
    Message.new(message, action, arguments)
  end
end
