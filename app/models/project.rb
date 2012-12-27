class Project < ActiveRecord::Base
  attr_accessible :descr, :name
  has_many :jobs
end
