class StatsController < ApplicationController
  before_filter :require_user

  def index
    @stats = Stat.all
    @stats_series = Stat.uniq_by_date
  end
end
