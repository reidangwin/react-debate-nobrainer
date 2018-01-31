class MakeArgumentJob
  class MakeArgumentJob < ActiveJob::Base
    def perform(argument_id)
      argument = Argument.find(argument_id)

      # ... here we are making coffee and reporting our progress periodically ...
      # offee_cup.update(status: 'grinding_beans', percent: 30)

      coffee_cup.update(body: 'ready')
    end
  end
end
