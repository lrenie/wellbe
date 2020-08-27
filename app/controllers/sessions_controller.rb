class SessionsController < ApplicationController
  def choice
    @sessions = Session.last(4)
  end

  def show
    @session = Session.find(params[:id])
    raise
  end
end
