require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_many(:chores)
  should have_many(:children).through(:chores)

  should validate_presence_of(:name)
  should validate_numericality_of(:points).is_greater_than(0).only_integer

  context 'scopes' do
    setup do
      @inactive_task = Task.create(name: 'Inactive Task', points: 5, active: false)
      @active_task = Task.create(name: 'Active Task', points: 10, active: true)
      @another_inactive_task = Task.create(name: 'Another Inactive Task', points: 8, active: false)
    end

    should 'order tasks alphabetically by name' do
      tasks = Task.alphabetical
      assert_equal ['Active Task', 'Another Inactive Task', 'Inactive Task'], tasks.map(&:name)
    end

    should 'only select active tasks' do
      active_tasks = Task.active
      assert_equal ['Active Task'], active_tasks.map(&:name)
    end
  end
end
