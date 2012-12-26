class Job < ActiveRecord::Base
  attr_accessible :description, :name, :finished
  validates_presence_of :name
  scope :finished, where(:finished=>true)
  scope :unfinished, where(:finished=>false)
  scope :by_time, order("updated_at DESC")
end
