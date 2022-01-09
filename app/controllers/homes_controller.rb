class HomesController < ApplicationController
  def index
    @top10 = Member.top10_members
  end
end
