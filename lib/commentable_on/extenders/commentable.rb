module CommentableOn
  module Extenders
    module Commentable
      def commentable?
        false
      end

      def acts_as_commentable(*_args)
        include CommentableOn::Commentable

        class_eval do
          def self.commentable?
            true
          end
        end
      end
    end
  end
end
