module CommentableOn
  module Extenders
    module Commenter
      def commenter?
        false
      end

      def acts_as_commenter(*_args)
        include CommentableOn::Commenter

        class_eval do
          def self.commenter?
            true
          end
        end
      end
    end
  end
end