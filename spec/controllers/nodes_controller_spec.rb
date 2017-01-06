require 'rails_helper'

RSpec.describe NodesController, type: :controller do
  before(:each) do
    @node_test1 = FactoryGirl.create(:node)
    @node_test2 = FactoryGirl.create(:node)
  end

  after(:each) do
    @node_test1.destroy
    @node_test2.destroy
  end

  describe 'GET index without params' do
    before(:each) do
      get :index
    end

    it 'should return 200' do
      expect(response.status).to eq(200)
    end

    it 'should return the right resource' do
      expect(assigns(:nodes)).to be_nil
    end

    it 'should render the right view' do
      expect(response).to render_template(:index)
    end
  end


  describe 'GET index with one param' do
    before(:each) do
      get :index, first_node: @node_test1.value
    end

    it 'should return 200' do
      expect(response.status).to eq(200)
    end

    it 'should return the right resource' do
      expect(assigns(:nodes)).to be_nil
    end

    it 'should render the right view' do
      expect(response).to render_template(:index)
    end
  end


  describe 'GET index with two param' do
    before(:each) do
      get :index, first_node: @node_test1.value, second_node: @node_test2.value
    end

    it 'should return 200' do
      expect(response.status).to eq(200)
    end

    it 'should return the right resource' do
      expect(assigns(:nodes)).not_to be_nil
      expect(assigns(:nodes)).to eq([@node_test1, @node_test2])
    end

    it 'should render the right view' do
      expect(response).to render_template(:index)
    end
  end
end
