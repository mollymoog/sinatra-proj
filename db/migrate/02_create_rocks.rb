class CreateRocks < ActiveRecord::Migration
    def change
        create_table :rocks do |t|
            t.string    :type
            t.string    :class
            t.string    :location
            t.datetime  :acquired
            t.integer   :weight_kg
        end
    end
end