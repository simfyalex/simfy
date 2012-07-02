require File.expand_path("../../spec_helper", __FILE__)

describe "Simfy" do
  pending "TODO. This is just basic examples for testing purpose. Specs should be of course separated by  indegration logic"
  describe 'Guest User' do
    let!(:user) { FactoryGirl.create(:user, :username => 'john', :email => 'john@example.com') }
    let!(:artist) { FactoryGirl.create(:artist, :name => 'Madona', :user_id => user.id) }
    describe 'home page' do
      it 'should see TODO' do
        visit '/'
        page.should have_content('TODO')
      end
      it 'should see artist page and see one artist' do
        visit '/artists'
        page.should have_content('Artists')
        page.should have_content('Madona')
      end

      it 'should see albums page ' do
        visit '/albums'
        page.should have_content('Albums')
      end
      it 'should see users page' do
        visit '/users'
        page.should have_content('Users')
      end
      it 'should not be able to edit artist' do
        lambda { visit "/users/#{user.username}/artists/#{artist.id}/edit" }.should raise_error
      end

      it 'should not be able to edit album' do
        lambda { visit "/users/#{user.username}/albums/#{artist.id}/edit" }.should raise_error
      end

    end


    describe 'Registered User' do
      it 'should successfully log in and open edit artist page' do
        visit '/login'
        page.should have_content('Sign in')
        fill_in 'user_email', :with => 'john@example.com'
        fill_in 'user_password', :with => 'password'
        click_button 'Sign in'
        page.should have_content('TODO')
        visit "/users/#{user.username}/artists/#{artist.id}/edit"
        page.should have_content('Editing artist')

      end
    end


  end
end