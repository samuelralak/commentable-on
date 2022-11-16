require "active_record"
require "active_support/inflector"
require "active_support/dependencies/autoload"

$LOAD_PATH.unshift(File.dirname(__FILE__))

module CommentableOn
  extend ActiveSupport::Autoload
  class Error < StandardError; end

  autoload :Commentable
  autoload :Comment
  autoload :Commenter
  autoload :Extenders

  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.extend CommentableOn::Extenders::Commentable
    ActiveRecord::Base.extend CommentableOn::Extenders::Commenter
  end
end
