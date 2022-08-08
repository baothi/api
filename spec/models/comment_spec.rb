require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#validations' do
    it 'should have valid factory' do
      # expect(build :comment).to be_valid
      expect(build(:comment)).to be_valid
    end

    it 'should test presence of attributes' do
      comment = Comment.new
      expect(comment).not_to be_valid
      expect(comment.errors.messages).to include({
        user: ['must exist'],
        article: ['must exist'],
        content: ["can't be blank"]
      })
    end


  end
end
