class TwilioController < ApplicationController
  include Twii

  # Set the correct headers
  after_filter :set_header

  # Disable CSRF protection
  skip_before_filter :verify_authenticity_token

  # Twilio SMS integration
  def sms
    # Ensure a valid request has been sent
    if !params.has_key?('From') || !params.has_key?('Body')
      render text: "400"
      return
    end

    # Get request information
    from = params[:From]
    body = params[:Body]

    logger.info("Received message from #{from}: #{body}")

    message = Parser.parse(body)

    render_twiml_message('Hello, client!')
  end
end