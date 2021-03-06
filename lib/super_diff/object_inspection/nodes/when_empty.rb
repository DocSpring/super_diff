module SuperDiff
  module ObjectInspection
    module Nodes
      class WhenEmpty < Base
        def evaluate(object, indent_level:, as_single_line:)
          if empty?(object)
            evaluate_in_subtree(
              object,
              indent_level: indent_level,
              as_single_line: as_single_line,
              &block
            )
          else
            ""
          end
        end

        private

        def empty?(object)
          if object.respond_to?(:empty?)
            object.empty?
          else
            object.instance_variables.empty?
          end
        end
      end
    end
  end
end
