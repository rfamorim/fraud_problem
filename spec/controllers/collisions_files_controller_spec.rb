require 'rails_helper'

RSpec.describe CollisionsFilesController, type: :controller do
  before(:each) do
    @collisions_file_test = FactoryGirl.create(:collisions_file)
  end

  after(:each) do
    @collisions_file_test.destroy
  end

  describe 'GET new' do
    before(:each) do
      get :new
    end

    it 'should return 200' do
      expect(response.status).to eq(200)
    end

    it 'should return the right resource' do
      expect(assigns(:collisions_file)).not_to be_nil
      expect(assigns(:collisions_file)).to be_a CollisionsFile
    end

    it 'should render the right view' do
      expect(response).to render_template(:new)
    end
  end

  def valid_attributes
    @original_file = fixture_file_upload("teste.txt", 'text/plain')
    {
      original_file: @original_file
    }
  end

  def invalid_attributes
    {
      original_file: nil
    }
  end

  describe 'POST create with correct attributes' do
    before(:each) do
      post :create, collisions_file: valid_attributes
    end

    it 'should return 302' do
      expect(response.status).to eq(302)
    end

    it 'should redirect to the resource' do
      expect(response).to redirect_to(new_collisions_file_path)
    end
  end

  describe 'POST create with incorrect attributes' do
    before(:each) do
      post :create, collisions_file: invalid_attributes
    end

    it 'should return 200' do
      expect(response.status).to eq(200)
    end

    it 'should set the right resource' do
      expect(assigns(:collisions_file)).not_to be_nil
    end

    it 'should render the right view' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create with incorrect attributes' do
    it 'should create an CollisionsFile' do
      expect do
        post :create, collisions_file: invalid_attributes
      end.to change {
        CollisionsFile.count
      }.by(0)
    end
  end
end
