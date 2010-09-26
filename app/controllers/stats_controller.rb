class StatsController < ApplicationController
  before_filter :require_user

  def index
    @stats = Stat.find(:all,
                       :order => 'created_at desc')
    @stats_series = Stat.uniq_by_date
  end
end
