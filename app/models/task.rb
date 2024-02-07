class Task < ApplicationRecord
    # have_many :chores
    # have_many :childs, through: :chores

    has_many :chores
    has_many :children, through: :chores

    validates :name, presence: true
    validates :points, numericality: { greater_than: 0, only_integer: true }

    scope :alphabetical, -> { order(:name) }
    scope :active, -> { where(active: true) }

end
