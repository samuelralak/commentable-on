require "spec_helper"

describe CommentableOn::Commentable do
  it "is not commentable" do
    expect(NotCommentable).not_to be_commentable
  end

  it "is commentable" do
    expect(Commentable).to be_commentable
  end

  it_behaves_like "a commentable_model" do
    let(:commenter) { create(:commenter, name: "i can comment!") }
    let(:commentable) { create(:commentable, name: "a commentable model") }
  end
end
