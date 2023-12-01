require 'rubygems'
require 'twilio-ruby'
class TwilioTextMessenger

  def call(mobile,otp)
    account_sid = 'AC3160c17d656d023aeeb10b6876b61dfc'
    auth_token = 'c73906e7c644f9446ef4d571b0ed50a5'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @mobile = mobile
    @otp = otp

    message = @client.messages.create(
      body: "Your OTP is #{@otp}",
      from: '+14022415598',
      to:"+91#{@mobile}"
    )

    # Capture the response details
    response = {
      sid: message.sid,
      message:message.body,
      from:message.from,
      to:message.to,
      status: message.status,
      created_at: message.date_created,
      updated_at: message.date_updated,
      # Add more attributes as needed
    }

    response

  end
end
