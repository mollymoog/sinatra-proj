class Rock < ActiveRecord::Base
    belongs_to :geologist
    validates :rock_class, :rock_type, :location, :acquired, :weight_g, presence: true

end