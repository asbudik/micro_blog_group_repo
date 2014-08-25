require 'rails_helper'

RSpec.describe Post, :type => :model do


  it "1) should create a post with the following information" do
    post = Post.new(:title => "Bauer fails to save world", :body => "Usurped by the ghost of Mussolini, Jack Bauer abjectly failed to do his duty")
    expect(post.class).to eq(Post)
    expect(post.title).to eq("Bauer fails to save world")
    expect(post.body).to eq("Usurped by the ghost of Mussolini, Jack Bauer abjectly failed to do his duty")
    expect(post.new_record?).to eq(true)
  end

  it "2) should save the post to the database" do
    post = Post.new(:title => "Bauer fails to save world", :body => "Usurped by the ghost of Mussolini, Jack Bauer abjectly failed to do his duty")
    expect(post.new_record?).to eq(true)
    expect(post.save).to eq(true)
    expect(post.new_record?).to eq(false)
  end
end
