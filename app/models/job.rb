class Job < ActiveRecord::Base
  attr_accessible :description, :name, :finished, :project, :project_id
  validates_presence_of :name, :project
  scope :finished, where(:finished=>true)
  scope :unfinished, where(:finished=>false)
  scope :by_time, order("updated_at DESC")
  belongs_to :project
end
