require "spec_helper"

describe CommentableOn::Commenter do
  it "is not commenter" do
    expect(NotCommenter).not_to be_commenter
  end

  it "is a commenter" do
    expect(Commenter).to be_commenter
  end

  it_behaves_like "a commenter_model" do
    let(:commenter) { create(:commenter, name: "i can comment!") }
    let(:commentable) { create(:commentable, name: "a commentable model") }
    let(:comment) { create(:comment, commenter: commenter, commentable: commentable, body: "awesome") }
  end
end
