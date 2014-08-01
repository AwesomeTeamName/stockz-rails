class TwilioController < ApplicationController
  include Twii

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