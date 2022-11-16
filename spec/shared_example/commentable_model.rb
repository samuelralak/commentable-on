shared_examples "a commentable_model" do
  it "has one comment when saved" do
    commentable.add_comment commenter: commenter, body: "some comment"
    expect(commentable.comments_for.size).to eq(1)
  end
end
