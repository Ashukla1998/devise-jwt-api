require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers
RSpec.describe Admin::BooksController, type: :controller do
  render_views
  before(:each) do
    @admin = AdminUser.create!(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
    @admin.save
    @book = Book.create(bname: "anil-o-upnished", aname: "Anil")
    sign_in @admin
  end
  describe 'GET#new' do
    it 'Get form' do
    	get :new, params: {"book": {aname: "gchgh"}}
    	expect(response).to have_http_status(200)
    end
	end

	describe 'GET#new' do
    it 'Get form' do
			pre_count = Book.count
    	post :create, params: {"book": {aname: "gchgh"}}
    	expect(response).to have_http_status(302)
			expect(Book.count).to eq(pre_count+1) 
    end
	end

	describe 'GET#new' do
    it 'Get form' do
    	get :index
    	expect(response).to have_http_status(200)
    end
	end
  
	describe 'GET#new' do
    it 'Get form' do
    	get :show, params: {id: @book.id}
    	expect(response).to have_http_status(200)
    end
	end

	describe 'GET#new' do
    it 'Get form' do
    	delete :destroy, params: {id: @book.id}
    	expect(response).to have_http_status(302)
    end
	end

	describe 'GET#new' do
    it 'Get form' do
    	get :edit, params: {id: @book.id,"book": {aname: "gchgh"}}
    	expect(response).to have_http_status(200)
    end
	end

	describe 'GET#new' do
    it 'Get form' do
    	post :update, params: {id: @book.id, "book": {aname: "joker"}}
    	expect(response).to have_http_status(302)
			@book.reload
			expect(@book.aname).to eq("joker") 
    end
	end

end