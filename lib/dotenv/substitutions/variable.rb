require "English"

module Dotenv
  module Substitutions
    # Substitute variables in a value.
    #
    #   HOST=example.com
    #   URL="https://$HOST"
    #
    module Variable
      class << self
        VARIABLE = /
          (\\)?          # is it escaped with a backslash?
          (\$)           # literal $
          \{?            # allow brace wrapping
          (?=$|[^()])    # require that the next character either be the end of line or non-parenthesis
          ([\w]+)?       # match the variable (or the lack thereof)
          \}?            # closing brace
        /x

        def call(value, env)
          value.gsub(VARIABLE) do |variable|
            match = $LAST_MATCH_INFO

            if match[1] == '\\'
              variable[1..-1]
            elsif match[3] != nil
              env.fetch(match[3]) { ENV[match[3]] }
            end
          end
        end
      end
    end
  end
end
