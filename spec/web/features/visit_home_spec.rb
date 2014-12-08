require 'spec_helper'

feature 'Visit Home', :vcr do
  background do
    url = 'http://feeds2.feedburner.com/Rubyflow'
    repository = Reeder::FeedRepository
    repository.clear

    repository.persist(
      Reeder::Feed.new(url: url)
    )

    Reeder::Commands::Update.new.run

    @feed    = repository.by_url(url)
    @article = Reeder::ArticleRepository.last
  end

  scenario 'User sees articles' do
    visit '/'

    expect(page).to have_title('Reeder')

    within '#articles' do
      within "#article-#{ @article.id }" do
        expect(page).to have_content(@article.title)
      end
    end
  end
end
