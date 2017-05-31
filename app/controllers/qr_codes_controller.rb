class QrCodesController < ApplicationController
  before_action :set_event, only: :create

  def create
    qrcode = RQRCode::QRCode.new(@event.access_code)

    send_data qrcode.as_png(size: 360), :type => "image/png", :filename => @event.name+" QR CODE"
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

end
