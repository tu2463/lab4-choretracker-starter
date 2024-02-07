class Child < ApplicationRecord
    has_many :chores
    has_many :tasks, through: :chores

    validates_presence_of :first_name
    validates_presence_of :last_name
end
