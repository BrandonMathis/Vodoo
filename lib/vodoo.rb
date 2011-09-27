require "vodoo/version"

module Vodoo
  class << self
    attr_accessor :task_file

    def all_tasks
      tasks = YAML.load_file(task_file)
    end

    def add_task(content)
      tasks = all_tasks
      File.open(task_file, "w") do |f|
        f.write(yaml(tasks))
      end
    end

    def yaml(hash)
      method = hash.respond_to?(:ya2yaml) ? :ya2yaml : :to_yaml
      string = hash.deep_stringify_keys.send(method)
      string.gsub("!ruby/symbol ", ":").sub("---","").split("\n").map(&:rstrip).join("\n").strip
    end
  end
  self.task_file = "tasks.yml"
end
