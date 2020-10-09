class AddColumnRocks < ActiveRecord::Migration[5.2]
    def change
        add_column :rocks, :geologist_id, :integer
    end
end