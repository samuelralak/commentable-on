module CommentableOn
  class Comment < ::ActiveRecord::Base
    if defined?(ProtectedAttributes)
      attr_accessible :commentable_id, :commentable_type, :commenter_id, :commenter_type, :commentable, :commenter, :body
    end

    belongs_to :commentable, polymorphic: true
    belongs_to :commenter, polymorphic: true

    validates_presence_of :commentable_id
    validates_presence_of :commenter_id
  end
end