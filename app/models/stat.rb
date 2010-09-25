class Stat < ActiveRecord::Base

  named_scope :all, :order => 'created_at asc'
  named_scope :for_date, lambda {|date| {:conditions => ['created_at >= ? AND created_at <= ?', Date.parse(date).beginning_of_day, Date.parse(date).end_of_day] } }

  def self.uniq_by_date
    _uniq = []
    Stat.all.map{|s| s.created_at.strftime("%m/%d/%Y")}.uniq.each do |d|
      _uniq << Stat.for_date(d).first    
    end
    _uniq
  end
  
  def date
    self.created_at.strftime("%m/%d/%Y")
  end

  def datum(kind)
    case kind
      when :lastfm_listeners;      Datum.new(:name => 'Last.fm Listeners', :date => self.date, :count => send(kind).to_i)
      when :lastfm_playcount;      Datum.new(:name => 'Last.fm Playcount', :date => self.date, :count => send(kind).to_i)
      when :twitter_friends;       Datum.new(:name => 'Twitter Friends',   :date => self.date, :count => send(kind).to_i)
      when :twitter_followers;     Datum.new(:name => 'Twitter Followers', :date => self.date, :count => send(kind).to_i)
      when :myspace_profile_views; Datum.new(:name => 'MySpace Views',     :date => self.date, :count => send(kind).to_i)
    end
  end
  
  class Datum
    attr_accessor :name
    attr_accessor :date
    attr_accessor :count
    def initialize(args)
      [:name, :date, :count].each{|a| self.send("#{a}=", args[a]) if args[a]}
    end
  end
  
end
