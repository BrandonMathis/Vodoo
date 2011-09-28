require 'spec_helper'
require 'ap'
require 'vodoo'

describe Vodoo do
  describe "list_tasks" do
    before do
      @file = File.join("spec", "fixtures", "tasks.yml")
      Vodoo.task_file = @file
    end
    it "should should list all tasks in task.yml" do
      Vodoo.all_tasks.should include("one" => "One")
    end
  end
  describe "add_task" do
    before do
      @file = File.join("spec", "fixtures", "new_tasks.yml")
      Vodoo.task_file = @file
    end
    it "should create a task in the task.yml" do
      time =  Time.now.to_s
      Vodoo.add_task(time, "Make this spec pass")
      Vodoo.all_tasks.should include(time => "Make this spec pass")
    end
    after do
      File.delete(@file) if File.exist? @file
    end
  end
end
