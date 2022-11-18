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

    def create_reply(comment:, commenter:, body:)
      unless comment.instance_of?(CommentableOn::Comment)
        return CommentableOn::Comment.create(commentable: self, commenter: commenter, body: body, parent_id: comment)
      end

      comment.children.create(commentable: self, commenter: commenter, body: body)
    end

    def root_comments
      comments.roots
    end

    def replies_for(comment)
      comments.children_of(comment)
    end

    def thread_for(comment)
      comments.descendents_of(comment)
    end
  end
end
