class AddFinishedToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :finished, :boolean
  end
end
