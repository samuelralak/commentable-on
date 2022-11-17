module CommentableOn
  module Commenter
    def self.included(base)
      base.class_eval do
        has_many :comments, class_name: "CommentableOn::Comment", as: :commenter, dependent: :nullify do
          def commentables
            includes(:commentable).map(&:commentable)
          end
        end
      end
    end

    def comment_on(commentable:, body:)
      commentable.add_comment args.merge(commenter: self, body: body)
    end

    def reply_to(comment:, body:)
      comment.add_reply(commenter: self, body: body)
    end
  end
end
