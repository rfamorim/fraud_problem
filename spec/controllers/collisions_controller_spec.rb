require 'rails_helper'

RSpec.describe CollisionsController, type: :controller do
  before(:each) do
    @collision_test = FactoryGirl.create(:collision)
  end

  after(:each) do
    @collision_test.destroy
  end

  describe 'GET new' do
    before(:each) do
      get :new
    end

    it 'should return 200' do
      expect(response.status).to eq(200)
    end

    it 'should return the right resource' do
      expect(assigns(:collision)).not_to be_nil
      expect(assigns(:collision)).to be_a Collision
    end

    it 'should render the right view' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create with correct attributes' do
    before(:each) do
      post :create, collision: FactoryGirl.attributes_for(:collision)
    end

    it 'should return 302' do
      expect(response.status).to eq(302)
    end

    it 'should set the right resource' do
      expect(assigns(:collision)).not_to be_nil
    end

    it 'should redirect to the resource' do
      expect(response).to redirect_to(new_collision_path)
    end
  end

  describe 'POST create with correct attributes' do
    it 'should create an Collision' do
      expect do
        post :create, collision: FactoryGirl.attributes_for(:collision)
      end.to change {
        Collision.count
      }.by(1)
    end
  end

  describe 'POST create with incorrect attributes' do
    before(:each) do
      post :create, collision: FactoryGirl.attributes_for(:collision, first_node: nil)
    end

    it 'should return 200' do
      expect(response.status).to eq(200)
    end

    it 'should set the right resource' do
      expect(assigns(:collision)).not_to be_nil
    end

    it 'should render the right view' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create with incorrect attributes' do
    it 'should create an Collision' do
      expect do
        post :create, collision: FactoryGirl.attributes_for(:collision, first_node: nil)
      end.to change {
        Collision.count
      }.by(0)
    end
  end
end
