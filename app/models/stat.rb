class Stat < ActiveRecord::Base
  named_scope :most_recent, :order => 'created_at desc'
end
