feature 'adding bookmarks' do
	scenario 'user adding bookmark adds bookmark to list' do
		connection = PG.connect(dbname: 'bookmark_manager_test')
		visit('/add_bookmark')
		fill_in :url, with: "www.bbc.co.uk/news"
		fill_in :title, with: "bbc"
		click_button 'Submit'
		visit('/bookmark')
		expect(page).to have_link('bbc', href: "www.bbc.co.uk/news")
	end
end