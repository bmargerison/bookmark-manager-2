feature 'bookmark page' do
	scenario 'click link to display bookmarks' do    
		  Bookmark.add('http://www.makersacademy.com')
			Bookmark.add('http://www.destroyallsoftware.com')
			Bookmark.add('http://www.google.com')
			visit('/bookmark')
			expect(page).to have_content "http://www.makersacademy.com"
			expect(page).to have_content "http://www.destroyallsoftware.com"
			expect(page).to have_content "http://www.google.com"
	end 
end