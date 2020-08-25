class SessionsController < ApplicationController
  def choice
    @sessions = Session.all
  end
end
