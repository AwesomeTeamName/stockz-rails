class TwilioController < ApplicationController
  include Twii

  after_filter :set_header
  skip_before_filter :verify_authenticity_token

  def sms
    if !params.has_key?('From') || !params.has_key?('Body')
      render status: 400
      return
    end

    from = params[:From]
    body = params[:Body]

    logger.info("Received message from #{from}: #{body}")

    render_twiml_message('Hello, client!')
  end
end