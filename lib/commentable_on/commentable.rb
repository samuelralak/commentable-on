module CommentableOn
  module Commentable
    def self.included(base)
      base.class_eval do
        has_many :comments, class_name: "CommentableOn::Comment", as: :commentable, dependent: :delete_all do
          def commenters
            includes(:commenter).map(&:commenter)
          end
        end
      end
    end

    def add_comment(commenter:, body:)
      comment = CommentableOn::Comment.new(commentable: self, commenter: commenter, body: body)
      comment.save
    end
  end
end
