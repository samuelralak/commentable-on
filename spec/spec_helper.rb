$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")
require "sqlite3"
require "commentable_on"
require "factory_bot"

Dir["./spec/shared_example/**/*.rb"].sort.each { |f| require f }
Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

ActiveRecord::Schema.define(version: 1) do
  create_table :comments do |t|
    t.references :commentable, polymorphic: true
    t.references :commenter, polymorphic: true
    t.text :body
    t.timestamps
  end

  add_index :comments, [:commentable_id, :commentable_type]
  add_index :comments, [:commenter_id, :commenter_type]

  create_table :commenters do |t|
    t.string :name
  end

  create_table :not_commenters do |t|
    t.string :name
  end

  create_table :commentables do |t|
    t.string :name
  end

  create_table :commentable_commenters do |t|
    t.string :name
  end

  create_table :not_commentables do |t|
    t.string :name
  end
end

class Commenter < ActiveRecord::Base
  acts_as_commenter
end

class NotCommenter < ActiveRecord::Base
end

class Commentable < ActiveRecord::Base
  acts_as_commentable
  validates_presence_of :name
end

class CommentableCommenter < ActiveRecord::Base
  acts_as_commentable
  acts_as_commenter
end

class NotCommentable < ActiveRecord::Base
end

class ABoringClass
  def self.hw
    "hello world"
  end
end

# RSpec.configure do |config|
#   # Enable flags like --only-failures and --next-failure
#   config.example_status_persistence_file_path = ".rspec_status"
#
#   # Disable RSpec exposing methods globally on `Module` and `main`
#   config.disable_monkey_patching!
#
#   config.expect_with :rspec do |c|
#     c.syntax = :expect
#   end
# end
