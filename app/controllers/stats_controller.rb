class StatsController < ApplicationController
  before_filter :require_user

  def index
    @stats = Stat.most_recent
  end
end
