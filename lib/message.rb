class Message
  # Create public readers for values
  attr_reader :raw
  attr_reader :action
  attr_reader :arguments

  def initialize(raw, action, arguments = [])
    # Validate argument types
    raise TypeError, "wrong argument type #{raw.class.name} for raw (expected String)" unless raw.is_a?(String)
    raise TypeError, "wrong argument type #{action.class.name} for action (expected String)" unless action.is_a?(String)
    raise TypeError, "wrong argument type #{arguments.class.name} for arguments (expected Array)" unless arguments.is_a?(Array)

    # Assign values
    @raw ||= raw
    @action ||= action
    @arguments ||= arguments
  end

  # Create private writers for values
private
  attr_writer :raw
  attr_writer :action
  attr_writer :arguments
end
