class CreateRocks < ActiveRecord::Migration[5.2]
    def change
        create_table :rocks do |t|
            t.string    :rock_type
            t.string    :rock_class
            t.string    :location
            t.datetime  :acquired
            t.integer   :weight_g
        end
    end
end