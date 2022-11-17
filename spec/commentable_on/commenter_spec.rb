require "spec_helper"

describe CommentableOn::Commentable do
  it "is not commenter" do
    expect(NotCommenter).not_to be_commenter
  end

  it "is a commenter" do
    expect(Commenter).to be_commenter
  end

  it_behaves_like "a commenter_model" do
    let(:commenter) { create(:commenter, name: "i can comment!") }
    let(:commentable) { create(:commentable, name: "a commentable model") }
    let(:comment) { create(:commentable, name: "a commentable model") }
  end
end
