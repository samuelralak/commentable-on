shared_examples "a commenter_model" do
  it "has one comment when saved" do
    commenter.comment_on commentable: commentable, body: "some comment"
    expect(commenter.comments.size).to eq(1)
  end
end