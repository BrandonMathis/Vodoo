require 'spec_helper'
require 'vodoo'

describe Vodoo do
  describe "list_tasks" do
    it "should should list all tasks in task.yml" do
      Vodoo.task_file = File.join("spec", "fixtures", "tasks.yml")
      Vodoo.all_tasks.should include("one" => "One")
    end
  end
  describe "create_task" do
    it "should create a task in the task.yml" do
    end
  end
end
