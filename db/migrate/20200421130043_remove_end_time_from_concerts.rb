class RemoveEndTimeFromConcerts < ActiveRecord::Migration[6.0]
  def change

    remove_column :concerts, :end_time, :datetime
  end
end
