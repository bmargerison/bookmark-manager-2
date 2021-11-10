feature 'bookmark page' do
	scenario 'click link to display bookmarks' do    
			Bookmark.add('http://www.makersacademy.com', 'Makers Academy')
			Bookmark.add('http://www.destroyallsoftware.com', 'Destroy All Software')
			Bookmark.add('http://www.google.com', 'Google')
			visit('/bookmark')
			expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
			expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
			expect(page).to have_link('Google', href: 'http://www.google.com')
	end 
end