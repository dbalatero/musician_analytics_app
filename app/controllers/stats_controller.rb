class StatsController < ApplicationController
  before_filter :require_user

  def index
    @stats = Stat.all
  end
end
