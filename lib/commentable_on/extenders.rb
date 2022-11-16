module CommentableOn
  module Extenders
    extend ActiveSupport::Autoload

    autoload :Commentable
    autoload :Commenter
  end
end