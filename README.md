# _**Under active development**_

# Commentable On Steroids 

Adds comments functionality to Rails/ActiveRecord modules

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'commentable_on'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install commentable_on

## Database migrations

Generate migration and run migrations

```shell
rails generate commentable_on:migration
rails db:migrate
```

## Usage

Make model commentable

```ruby
class Post < ActiveRecord::Base
  acts_as_commentable
end
```

Add a comment to model instance:
  ```ruby
  @post = Post.find(params[:post_id])
  @post.add_comment(commenter: current_user, body: "Awesome")
   ```

The commenter, add `acts_as_commenter` to commenter models for reserve functionality
```ruby
class User < ActiveRecord::Base
  acts_as_commenter
end
```

Add comment as a commenter
```ruby
@post = Post.find(params[:post_id])
current_user.comment(commentable: @post, body: "awesome")
```
  
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/commentable_on. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/commentable_on/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CommentableOn project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/commentable_on/blob/master/CODE_OF_CONDUCT.md).

## TO DO

- [ ] Add comment threading
- [ ] Add migration generators 
- [ ] Automate gem release
- [ ] Add contribution guideline
