require 'twilio-ruby'

module Twii
  extend ActiveSupport::Concern

  def set_header
    response.headers['Content-Type'] = 'text/xml'
  end

  def render_twiml(response)
    raise TypeError, "wrong argument type #{response.class.name} for response (expected Twilio::TwiML::Response)" unless response.is_a? Twilio::TwiML::Response

    render text: response.text
  end

  def render_twiml_message(message)
    raise TypeError, "wrong argument type #{message.class.name} for message (expected String)" unless message.is_a? String

    response = Twilio::TwiML::Response.new do |r|
      r.Message(message)
    end

    render_twiml(response)
end
