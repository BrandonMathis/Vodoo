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
      sha = Digest::SHA1.hexdigest content
      tasks[sha] = {}
      tasks[sha][:content] = content
      tasks[sha][:created] = time
      File.open(task_file, "w") do |f|
        f.write(tasks.to_yaml)
      end
      return sha
    end

    def remove_task(sha)
      tasks = all_tasks
      tasks.delete sha
    end

    private
    def publish_tasks(tasks)
      File.open(task_file, "w") do |f|
        f.write(tasks.to_yaml)
      end
    end
  end
end
