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
      Vodoo.all_tasks.should include("fe05bcdcdc4928012781a5f1a2a77cbb5398e106" => {"content" => "One"})
    end
  end
  describe "add_task" do
    before do
      @file = File.join("spec", "fixtures", "new_tasks.yml")
      Vodoo.task_file = @file
      @sha = Vodoo.add_task("today at midnight", "Make this spec pass")
    end
    it "should create a task in the task.yml" do
      Vodoo.all_tasks[@sha].should include( :content => "Make this spec pass" )
    end
    after do
      File.delete(@file) if File.exist? @file
    end
    describe "remove_task" do
      before do
        Vodoo.remove_task @sha
      end
      it "should removed task from the yml" do
        Vodoo.all_tasks.should == {}
      end
    end
  end
end
