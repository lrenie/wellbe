class SessionsController < ApplicationController
  def choice
    @sessions = Session.last(4)
  end
end
