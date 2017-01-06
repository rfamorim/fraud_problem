require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
	describe "when the home page is called" do
		before(:each) do
			get :home
		end

		it 'should return 200' do
			expect(response.status).to eq(200)
		end

		it 'should render the right view' do
			expect(response).to render_template(:home)
		end
	end
end