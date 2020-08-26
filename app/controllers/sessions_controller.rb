class SessionsController < ApplicationController
  def choice
    @sessions = Session.all
  end

  def new
    @session = Session.new
    authorize @session
  end
end
