require 'twilio-ruby'

module Twii
  extend ActiveSupport::Concern

  # Set the correct headers for a TwiML document
  # To be used with after_filter
  def set_header
    response.headers['Content-Type'] = 'text/xml'
  end

  # Render a TwiML::Response
  def render_twiml(response)
    # Validate argument type
    raise TypeError, "wrong argument type #{response.class.name} for response (expected Twilio::TwiML::Response)" unless response.is_a?(Twilio::TwiML::Response)

    # Render the response's text
    render text: response.text
  end

  # Render a plaintext message inside <Message> tags.
  def render_twiml_message(message)
    # Validate argument type
    raise TypeError, "wrong argument type #{message.class.name} for message (expected String)" unless message.is_a?(String)

    # Generate the response
    response = Twilio::TwiML::Response.new do |r|
      r.Message(message)
    end

    # Call the render method for responses
    render_twiml(response)
  end
end
