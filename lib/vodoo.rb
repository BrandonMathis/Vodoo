require "vodoo/version"
require 'chronic'

module Vodoo
  class << self
    attr_accessor :task_file
    def all_tasks
      ( File.exist? self.task_file )? YAML.load_file(self.task_file) : {}
    end

    def add_task(time, content)
      tasks = all_tasks
      time = Chronic.parse(time).to_s
      tasks[time] = content
      File.open(task_file, "w") do |f|
        f.write(tasks.to_yaml)
      end
    end
  end
end
