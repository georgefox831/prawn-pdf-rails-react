class HomeController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "react-rendered"
      end
    end
  end

  def create
    PdfMailer.benchmark.deliver_now
  end
end
