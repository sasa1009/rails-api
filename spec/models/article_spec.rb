require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validations' do
    let(:article) { create(:article) }

    it 'tests that factory is valid' do
      expect(article).to be_valid
    end

    it 'has an invalid title' do
      article.title = ''
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'has an invalid content' do
      article.content = ''
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'has an invalid slug' do
      article.slug = ''
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end

    it 'slug should be unique' do
      article # articleを作成
      anotherArticle = create(:article) # もう一つ別のarticleを作成
      anotherArticle.slug = article.slug
      expect(anotherArticle).not_to be_valid # slugが重複するのでエラーが出る
      expect(anotherArticle.errors[:slug]).to include("has already been taken")
    end
  end
end
