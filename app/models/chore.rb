class Chore < ApplicationRecord
    belongs_to :child
    belongs_to :task

    validates :due_on, timeliness: { type: :date }

    scope :by_task, ->{ joins(:task).order('name') }
    scope :chronological, -> { order(:due_on) }
    scope :pending, -> {where(completed: false)}
    scope :done, -> {where(completed: true)}
    scope :upcoming, ->{where('due_on >= ?', Date.today)}
    scope :past, -> {where('due_on < ?', Date.today)}

    def status
        if completed
            return 'Completed'
        else
            return 'Pending'
        end
    end
end
