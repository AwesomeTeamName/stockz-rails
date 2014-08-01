class TwilioController < ApplicationController
  include Twii

  HANDLER = ActionHandler.new

  # Set the correct headers
  after_filter :set_header

  # Disable CSRF protection
  skip_before_filter :verify_authenticity_token

  # Twilio SMS integration
  def sms
    # Ensure a valid request has been sent
    if !params.has_key?('From') || !params.has_key?('Body')
      render status: 400, text: 'Invalid request'
      return
    end

    # Get request information
    from = params[:From]
    body = params[:Body]

    logger.info("Received message from #{from}: #{body}")

    message = Parser.parse(body, from)
    response = HANDLER.handle(message, false)

    if not response.is_a?(String)
      render_twiml_message('Invalid action, reply with HELP for more information.')
      return
    end

    render_twiml_message(response)
  end
end
